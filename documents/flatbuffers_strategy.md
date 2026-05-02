# STAC Flatbuffers Parser — Strategy

> **Status:** Strategy / pre-implementation. This document was authored in the
> `stac-forui-components` repository on 2026-04-30 and is intended to **move**
> to a new dedicated repository (working title: `stac_flatbuffers`) once that
> repo is created. References to "this library" below mean the future
> Flatbuffers library, not `stac-forui-components`.

---

## 1. Context

STAC ([github.com/StacDev/stac](https://github.com/StacDev/stac),
[docs.stac.dev](https://docs.stac.dev/concepts/stac_registry)) is a
server-driven UI framework for Flutter. The wire format today is JSON: the
server delivers a tree of `{ "type": "...", ...props }` nodes, and STAC's
registry routes each node to a `StacParser` that constructs a Flutter widget.

`stac-forui-components` is a STAC integration that adds parsers for the
[`forui`](https://forui.dev) UI library (~30 components, model + parser per
component). It is JSON-only.

This document outlines the strategy for a **separate** library that adds a
**Flatbuffers** wire format to the same STAC ecosystem, while reusing the
semantic model decisions already made in `stac-forui-components` (notably the
[token-based theming
decision](./audits/assessment.md#33-recommendations)).

## 2. Goals

1. Reduce STAC payload size and parse cost on the client by replacing JSON with
   Flatbuffers on the wire.
2. Coexist with the JSON pipeline. A single client app may consume both; a
   single server may serve both based on `Accept` headers.
3. Reuse `stac-forui-components`' Dart model classes and token vocabulary as
   the semantic source of truth. The Flatbuffers schema is a **wire projection**
   of those models, not a parallel design.
4. Stay inside STAC's existing extension surface (`StacParser` /
   `StacActionParser` / `Stac.initialize`) **as the default path**. No fork
   of upstream STAC. A small, **additive** upstream PR is acceptable as a
   fallback if — and only if — measurement shows the in-extension-surface
   approach leaves meaningful performance on the table (see §5.4).
5. Set up a schema-evolution discipline so adding components later is cheap
   and removing/reshaping fields is *possible* (Flatbuffers' default
   guarantees, made explicit).

## 3. Non-goals

- **Designing a new SDUI protocol.** The semantics of STAC are unchanged; only
  the encoding changes.
- **Zero-copy widget construction in v1.** Optional v2 work; see §5 Option β.
- **Owning widget parsers.** This library does not contain `FButton`-shaped
  parsers; those stay in `stac-forui-components`. This library handles encoding
  only.
- **Replacing JSON.** JSON is the lingua franca of the ecosystem. We add
  Flatbuffers as a peer.
- **Auto-translating arbitrary STAC packages.** Out of scope. The library
  ships first-class support for `stac-forui-components`; other STAC component
  packages can be added per-package by their authors.

## 4. Why Flatbuffers (and not Protobuf / MessagePack / CBOR)

| Format        | Schema       | Zero-copy | Dart support | Notes |
|---------------|--------------|-----------|--------------|-------|
| JSON          | None         | No        | First-class  | Status quo. Wins on debuggability, loses on size & parse cost. |
| MessagePack   | None         | No        | OK           | Smaller than JSON, ~same parse model. No schema discipline. |
| CBOR          | None         | No        | OK           | Same tradeoffs as MessagePack. |
| Protobuf      | `.proto`     | No        | OK           | Schema'd. Heavy generated code. Always allocates. |
| **Flatbuffers** | `.fbs`     | **Yes**   | OK (`flat_buffers` package) | Schema'd. Reads happen *in place* on the byte buffer; you only allocate when you accept the value. Best fit for trees that are mostly walked once. |

For SDUI specifically, payloads are read once and discarded. Flatbuffers'
zero-copy access pattern means the parser can walk the tree without
materializing intermediate Dart objects for branches it doesn't enter
(e.g., off-screen children inside a lazy `ListView`).

The schema discipline is the second reason: Flatbuffers' append-only field
rules force evolution to be backwards-compatible by construction.

## 5. Integration with STAC's parser registry

The honest sequence is **build, measure, then decide** — not "pick the right
option up front." Three implementation shapes exist (§5.1–5.3); the decision
between them is data-driven, and a fourth option (§5.4) — a targeted upstream
PR — sits behind §5.3 as a fallback only if profiling justifies it.

> **Decision sequence** (do these in order, do not skip ahead):
>
> 1. Build §5.3 (lazy adapter) for **one** component end-to-end.
> 2. Measure: payload size, parse time, render time, allocation count vs. JSON.
> 3. If §5.3 is good enough → ship it; skip §5.4 entirely. You will have spent
>    zero political capital upstream.
> 4. Only if profiling shows the `Map`-interface overhead is the actual
>    bottleneck → draft §5.4. By then you have data, which is the difference
>    between a PR that gets merged and one that gets "interesting, but…"

STAC's public extension point is `StacParser`. From the existing implementation
in `stac-forui-components/lib/src/parsers/`:

```dart
class StacForuiButtonParser extends StacParser<StacForuiButton> {
  @override String get type => 'forui_button';
  @override StacForuiButton getModel(Map<String, dynamic> json) =>
      StacForuiButton.fromJson(json);
  @override Widget parse(BuildContext context, StacForuiButton model) { ... }
}
```

`getModel` takes `Map<String, dynamic>`. That's the integration constraint.
The library has three viable shapes:

### 5.1 Option α — Decode-then-bridge (simple, shallow win)

The library exposes a single entry point that decodes a Flatbuffers byte buffer
into a `Map<String, dynamic>` and hands it to `Stac.fromJson(map, context)`.
Existing parsers run unchanged.

- **Win:** Trivial integration. Zero changes to component libraries.
- **Loss:** Throws away Flatbuffers' main benefit. Materializes a full Dart
  Map tree in memory before parsing. Effectively just "smaller-on-wire JSON."

### 5.2 Option β — Custom entry point, parallel pipeline (V2)

The library defines a parallel parser interface
(`StacForuiButtonFbsParser extends StacFlatbuffersParser`) that reads
directly from a Flatbuffers `Reader` and constructs the widget without going
through a Dart Map. Each component package would need a second parser per
component.

- **Win:** True zero-copy. Skips Map allocation entirely.
- **Loss:** Doubles the parser count in every component package. Doubles
  the test surface. Forks the integration story.

### 5.3 Option γ — Lazy adapter (V1 starting point)

The library generates Dart classes that **implement `Map<String, dynamic>`**
on top of a Flatbuffers byte buffer. Field reads go straight to the buffer;
nested children return another lazy adapter, also implementing
`Map<String, dynamic>`. The adapter is handed to existing
`Stac.fromJson(map, context)` unchanged.

- **Win:** No change to existing parsers in `stac-forui-components`. Branches
  not entered are never materialized. Coexists with JSON without forks.
- **Cost:** A code-generation step (`.fbs` → Dart adapter classes). Some
  parsers will iterate `map.keys` or check `map.containsKey` in surprising
  ways — adapter must implement the full `Map` interface, not a subset.
- **Risk:** Performance cliff if a parser does `Map.from(map)` or
  `jsonEncode(map)` on a hot path. Audit needed; in practice
  `stac-forui-components` parsers do not.

**Why §5.3 first, not §5.2:** §5.3 is the only option that ships Flatbuffers
without touching `stac-forui-components` (or any other STAC component package)
at all. The `stac-forui-components` parsers I read for the audit do not do
`Map.from(map)` or `jsonEncode(map)` on hot paths — they index by known keys.
The lazy `Map`-interface adapter should slot in cleanly. The cost of being
wrong about this is "we measured and profiling pointed to the adapter as the
bottleneck," which is not a disaster — it's just the trigger for §5.4.

### 5.4 Targeted upstream PR — fallback only, gated on data

If §5.3 measurement shows the `Map<String, dynamic>` adapter is the actual
bottleneck (and not, say, the round-trip through `Stac.fromJson`'s type
dispatch, or the Flutter widget tree itself — measure carefully), the cleanest
path forward is a **purely additive** upstream PR.

**What to propose** (sketch, not final API):

```dart
// New abstract class — lives alongside StacParser, does NOT replace it.
abstract class StacBinaryParser<T> {
  String get type;
  T getModelFromBytes(ByteData bytes, int offset, BuildContext context);
  Widget parse(BuildContext context, T model);
}

// New entry point — lives alongside Stac.fromJson, does NOT replace it.
class Stac {
  static Widget? fromBytes(Uint8List bytes, BuildContext context) { … }
  // existing static Widget? fromJson(...) untouched
}

// Existing Stac.initialize gets one new optional named parameter.
await Stac.initialize(
  parsers: [...],            // unchanged
  actionParsers: [...],      // unchanged
  binaryParsers: [...],      // new, optional, defaults to const []
);
```

**Why this is the version that has a chance of being merged:**

- **Purely additive.** Every existing `StacParser` keeps working unchanged.
  Every existing app keeps working unchanged. Component-package authors who
  don't care about Flatbuffers do nothing.
- **Mirrors the action-parser pattern STAC already uses.** `StacActionParser`
  is a parallel-interface, parallel-registration extension point. The PR
  proposes the same pattern, applied one level over: parallel interface for a
  parallel wire format. Maintainers don't have to learn a new concept.
- **Small surface.** One new abstract class, one new static method, one new
  optional parameter on `Stac.initialize`. ~150 lines of upstream change,
  most of it the new class itself.
- **Doesn't touch the registry semantics.** Type-string dispatch still works
  the same way; the registry just gains a parallel map keyed by the same
  `type` string.

**Why the "obvious" PR is the wrong PR:** parameterizing `StacParser` over
the input type (e.g., `StacParser<TInput, TModel>`) is the design that *looks*
right on paper. Don't propose this. It breaks every parser ever written, it
breaks `StacActionParser` symmetry, and it puts the maintainers in the
position of either accepting a massive ecosystem migration or rejecting your
PR. Both outcomes are bad.

**Bar to cross before opening this PR:**

1. §5.3 is shipped and in production for at least one component.
2. You have benchmark numbers for §5.3 vs. §5.4 (you'll have to prototype
   §5.4 locally to get the comparison — that's fine, do it as a fork branch
   not a PR).
3. The benchmark difference is meaningful for a real workload, not a
   microbenchmark. "10× faster on a 50KB synthetic tree" is not a
   user-visible win; "16ms saved on every screen transition for the
   median user" is.
4. The PR description leads with the data, not the design.

**If the PR is rejected:** revert to §5.3 in production. You are not
blocked — you have working software shipping the whole time. This is the
critical property of doing things in this order.

## 6. Schema design principles

### 6.1 Tables, unions, enums

Each STAC widget type maps to a Flatbuffers `table`:

```fbs
table ForuiButton {
  key: string;
  label: string;
  variant: ButtonVariant = primary;   // enum, see §6.3
  size: ButtonSize = medium;          // enum
  on_press: StacAction;               // union, see §6.4
  prefix_icon: StacNode;              // union (recursive)
  suffix_icon: StacNode;
  child: StacNode;
}
```

The widget tree is a recursive union:

```fbs
union StacNode {
  ForuiButton,
  ForuiTextField,
  ForuiSwitch,
  ForuiTheme,
  // ... one entry per registered component
}

table StacRoot { node: StacNode; }
```

Polymorphism lives entirely in the union. The `type` discriminator string from
JSON is implicit — Flatbuffers carries the union tag in 1 byte instead of a
string.

### 6.2 The "free-form Map" problem

JSON STAC has several places where a field is `Map<String, dynamic>`:
arbitrary nested widgets (`prefixIcon`, `child`), action payloads, theme deltas.
Flatbuffers needs typed schemas; "any map" is anti-Flatbuffers.

**Strategy:**
- **Nested widgets** (`prefixIcon`, `child`, `children`): use the `StacNode`
  union (§6.1). Already typed.
- **Action payloads:** discriminated `StacAction` union (§6.4). Already typed.
- **Genuinely open-ended payloads** that must remain dynamic (e.g., a future
  `customData` blob a customer wants to round-trip without schema changes):
  carry as an opaque embedded JSON string.

```fbs
table OpaqueJson { value: string; }   // last-resort escape hatch
```

This is a pragmatic admission, not a design feature. The goal is for it to be
empty 99% of the time.

### 6.3 Color & typography tokens (cross-reference)

Per the [adopted theming decision](./audits/assessment.md#33-recommendations),
colors and typography are referenced by *semantic token name*, not hex. In
Flatbuffers, this becomes:

```fbs
enum ColorToken : ushort {
  primary,
  primary_foreground,
  secondary,
  secondary_foreground,
  surface,
  surface_foreground,
  muted,
  muted_foreground,
  destructive,
  destructive_foreground,
  border,
  // grow append-only
}

enum TypographyToken : ushort {
  display, title, heading, body, label, caption,
}
```

A 2-byte enum replaces what would otherwise be a 7-byte hex string per color
field. **This is the largest single byte saving in a typical STAC payload**
and the most important reason to land token-based theming **before** building
this library — the schema gets to be born with enums, not retrofit with them.

### 6.4 Action payloads as discriminated unions

Today in `stac-forui-components`, every action field is
`Map<String, dynamic>?`. The fbs schema makes them typed:

```fbs
table ActionNavigate { route: string; arguments: OpaqueJson; }
table ActionShowToast { ... mirrors StacForuiToast ... }
table ActionShowDialog { ... }
table ActionShowSheet { ... }
table ActionUpdateState { key: string; value: OpaqueJson; }
table ActionCustom { type: string; payload: OpaqueJson; }   // escape hatch

union StacAction {
  ActionNavigate,
  ActionShowToast,
  ActionShowDialog,
  ActionShowSheet,
  ActionUpdateState,
  ActionCustom,
}
```

`ActionCustom` is the open-world fallback for actions defined by libraries
this one doesn't know about. The generator should emit a warning when it
falls back to `ActionCustom`.

### 6.5 Schema evolution rules (write these on the wall)

Flatbuffers' guarantees only hold if the rules are followed:

1. **Append-only.** New fields go at the end of a `table`. Never reorder
   existing fields. Never delete an existing field — `deprecated` it.
2. **Union tags are forever.** Removing or reusing a union tag breaks every
   client that ever shipped with the old schema. Add new components by
   appending to `StacNode`.
3. **Enum values are forever.** Same logic. Append; never reorder.
4. **Default values are part of the contract.** Changing a default changes
   client behavior for all old payloads.
5. **`ColorToken`, `TypographyToken`, `StacNode`, and `StacAction` are the
   four schema dimensions most likely to grow.** Plan for it: keep them in
   their own `.fbs` files so PR diffs that add a token or component are
   small.

A pre-commit check should run `flatc --json-schema --schema` on staged
`.fbs` files and fail if any field/union tag/enum value is removed or
reordered.

## 7. Source-of-truth & codegen pipeline

The Dart model classes in `stac-forui-components/lib/src/models/` already
carry the semantic source of truth (field names, types, optional/required,
JSON keys). Duplicating this into hand-written `.fbs` files is busywork and
will drift.

**Recommended pipeline:**

```
┌────────────────────────────┐
│  Dart model class          │
│  (stac-forui-components)   │  — semantic source of truth
│  @JsonSerializable()       │
└──────────────┬─────────────┘
               │ codegen (this library)
               ▼
┌────────────────────────────┐
│  .fbs schema file          │  — wire projection
└──────────────┬─────────────┘
               │ flatc
               ▼
┌────────────────────────────┐
│  Generated Dart adapter    │
│  implements Map<String,..> │  — Option γ runtime
└────────────────────────────┘
```

The codegen step reads the analyzer output for each model class, walks its
fields, and emits a `.fbs` table. Token enums are picked up from a small
hand-written registry (`tokens.fbs`) shared with the theming work.

Open question: is the codegen a **build-time** generator inside the consuming
app, a **CI step** in `stac-forui-components`, or a **manual export**? V1
recommendation: manual `dart run stac_flatbuffers:generate`, committed
artifacts. Move to build-time later if churn justifies it.

## 8. Migration & coexistence with JSON

The two pipelines must coexist on a single client:

```dart
void main() async {
  await Stac.initialize(
    parsers: [
      // existing JSON parsers — unchanged
      const StacForuiButtonParser(),
      // ... etc
    ],
  );
  StacFlatbuffers.register();   // installs the fbs entry point
  runApp(const MyApp());
}
```

`StacFlatbuffers.register()` does not register per-component parsers (those
live in `stac-forui-components`). It installs:
1. A way to receive a `Uint8List` and produce a `Stac.fromJson(adapter, ctx)`
   call (Option γ).
2. An action-payload bridge so a fbs `ActionShowToast` is handed to
   `StacForuiShowToastActionParser` as if it were JSON.

Server side: a single endpoint inspects `Accept: application/x-stac+fb` vs
`application/json` and serves accordingly. Both encodings produce the same
widget tree from the same semantic models — round-trip equivalence is a
testable property (see §9).

## 9. Test strategy

1. **Round-trip equivalence (the headline test).** For every model in
   `stac-forui-components`: build a Dart instance → serialize to JSON →
   render widget tree → snapshot. Then: same Dart instance → serialize to fbs
   → adapter → render widget tree → snapshot. **Snapshots must match.**
2. **Schema-evolution guard.** A CI test loads payloads serialized with
   schema vN-1 and asserts they parse cleanly with schema vN. Catches any
   accidentally-removed field.
3. **Adapter conformance.** The lazy `Map<String, dynamic>` adapter must
   pass a contract test: `keys`, `containsKey`, `[]`, `entries`, iteration
   order — match a real `Map`.
4. **Fuzzing.** Random fbs byte buffers fed through the adapter must never
   panic; malformed input must surface as a typed parse error, not an
   uncaught exception.
5. **Performance regression.** Microbenchmark adapter `Map` access against
   a real `Map` of equivalent shape. Set a budget (e.g., adapter ≤ 2× real
   Map for shallow access); fail CI on regression.

## 10. Boundary with `stac-forui-components`

This library **depends on** `stac-forui-components`. The reverse must not
hold. Specifically:

- This library imports model classes from `stac-forui-components` to drive
  codegen.
- This library imports the `ColorToken` / `TypographyToken` vocabulary from
  `stac-forui-components` (or wherever the token decision settles —
  potentially a third, smaller `stac_forui_tokens` package if the dependency
  graph gets awkward).
- `stac-forui-components` does **not** import this library. A consumer who
  doesn't want fbs simply doesn't add this package.

If the dependency graph reverses (token vocabulary needs to live below this
library), extract tokens into a tiny shared package consumed by both. Don't
hoist them into this one.

## 11. Open questions / decisions deferred

The following are explicitly **not decided** in this document. Each will need
a call before or during implementation.

1. **Codegen mechanism.** Analyzer-based vs annotation-based vs hand-written
   `.fbs` files. Trade-offs: analyzer is most automatic but ties us to
   `analyzer` versions; annotations are simpler but more typing.
2. **`StacNode` union maximum size.** Flatbuffers union tags are `ubyte` by
   default (255 max) and can be promoted to `ushort` (65535). Pick `ushort`
   from day one to avoid a breaking schema change later.
3. **String interning for token names in `OpaqueJson` / `ActionCustom`.**
   Probably premature optimization, but worth flagging.
4. **Streaming / chunked decode.** A very large STAC tree could be served
   as a stream of `StacNode`s. Not in v1 scope; flag for v2 if used.
5. **Server-side libraries.** Out of scope for this repo, but the schema
   needs to be consumable from at least one server language. `flatc`
   supports many; pick a reference server stack early to avoid client-side
   schema choices that hurt server ergonomics.
6. **Compression.** Brotli over fbs is often a meaningful additional
   reduction. Leave to the transport layer (HTTP `Content-Encoding`); do not
   bake into the library.
7. **Versioning the schema itself.** Embed a `schema_version: ushort` field
   in `StacRoot` for client-side gating and metrics. Should v1 ship with
   `schema_version = 1`? Probably yes.

## 12. Concrete next steps (when this document moves to its new repo)

1. Land token-based theming (RT1–RT5 in
   [the audit](./audits/assessment.md)) in `stac-forui-components`.
   **Blocking.** Schema cannot be designed correctly without the token
   vocabulary stable.
2. Create the new repo. Recommended name: `stac_flatbuffers` or
   `stac_forui_flatbuffers` if the scope stays forui-flavored.
3. Stand up the `.fbs` schema for one component (`ForuiButton` is the
   smallest non-trivial choice — has a token, an action, and a child).
4. Build the lazy `Map<String, dynamic>` adapter for that one component.
5. Write the round-trip equivalence test (§9.1) for that one component.
6. **Demo.** A minimal Flutter app that boots, renders a button from
   JSON and from fbs side-by-side, asserts both render identically.
7. **Measure** — payload size, parse time, render time, allocation count
   on a realistic tree (not a single button). Compare §5.3 (lazy adapter)
   against the JSON path. **This is the data that decides whether §5.4
   (upstream PR) is worth pursuing.** Until this step happens, do not draft
   the PR, do not open issues upstream, do not start a "what if we forked"
   conversation. The order matters.
8. Generalize: codegen pipeline (§7), schema-evolution guard (§9.2),
   per-component adapters for the rest of `stac-forui-components`.
9. **Only if step 7 data justifies it:** prototype §5.4 on a fork branch,
   benchmark against §5.3 on the same realistic tree, then open the upstream
   PR with the comparison numbers in the description.

---

## Appendix A — Example `.fbs` for `ForuiButton`

Illustrative. Field IDs and tags would be assigned by codegen.

```fbs
include "tokens.fbs";
include "actions.fbs";
include "stac_node.fbs";

namespace stac.forui;

enum ButtonVariant : ushort {
  primary, secondary, destructive, outline, ghost,
}

enum ButtonSize : ushort {
  small, medium, large,
}

table ForuiButton {
  key: string;
  label: string;                    // null when child is non-null
  child: StacNode;                  // null when label is non-null
  prefix_icon: StacNode;
  suffix_icon: StacNode;
  variant: ButtonVariant = primary;
  size: ButtonSize = medium;
  foreground_color: ColorToken;     // optional override; defaults to variant
  on_press: StacAction;
}
```

## Appendix B — Reference reading

- STAC registry & custom parsers: <https://docs.stac.dev/concepts/stac_registry>
- STAC repository: <https://github.com/StacDev/stac>
- STAC skills (LLM tooling, not runtime): <https://docs.stac.dev/skills>
- forui: <https://forui.dev>
- Flatbuffers Dart bindings: package `flat_buffers` on pub.dev
- Flatbuffers schema evolution: <https://flatbuffers.dev/flatbuffers_guide_writing_schema.html>
