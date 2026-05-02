# Audit Assessment — `stac_forui_components`

- **Date:** 2026-04-30
- **Auditor:** Claude (Opus 4.7)
- **Scope:** Per `documents/audits/Audit_scope.md`. In-progress repo; findings focus on architectural risks and avoidable refactors, not on absent components.
- **Commit audited:** `ab83383` (HEAD of `main`)

---

## 3.1 Summary

### Overall health score: **B+ (architecturally sound, hygiene-deficient)**

The package has a strong, uniform architecture. Across 29 widget parsers, 32 models, 3 custom actions, and 25 test files, conventions are remarkably consistent — a credit to whoever set the early templates. The biggest risks are **not** in the code that exists; they are (a) architectural decisions that have been deferred and will be expensive to retrofit (hooks, state-management, Flatbuffers-friendly schemas), and (b) hygiene gaps (zero doc-comments, stub README, sparse `analysis_options.yaml`) that compound as the API surface grows.

### Key findings (what matters)

1. **Architectural patterns are uniform.** Every parser sampled (button, text_field, switch, dialog, accordion, slider, scaffold, calendar, resizable, toaster) follows the same shape: `getModel` → `parse` → `Stac.onCallFromJson` for callbacks → `key: model.key != null ? ValueKey<String>(model.key!) : null`. Null-handling is defensive (every `!` is gated by an `is null` check). No `print()`, no `TODO`/`FIXME`/`HACK` markers in `lib/`.
2. **Three deferred plan items are real refactor risk.** The plan (lines 9–10, 95–98) calls for hook integration, dual state-management strategy, and Flatbuffers-compatible field shapes. Only `FTheme` integration is implemented. `Map<String, dynamic>?` for actions and `dynamic` for toast title/description (`stac_forui_toast.dart:16-17`) are flexible today but will require a schema-evolution pass for a binary protocol.
3. **Test coverage is uneven.** 25 test files exist (1,679 LOC), but coverage is shallow for ~7 components and inconsistent on action callbacks. `stac_forui_models_test.dart` (368 LOC) carries most of the JSON-roundtrip burden; widget-side tests for `text_field`, `dialog`, and several others verify parsing/keys but not action firing.
4. **Documentation void.** `grep '///' lib/src` returns **0 doc comments**. README is the Flutter scaffold stub. CHANGELOG has 4 bullets and is already out of date (it doesn't mention 25+ components shipped after `0.0.1`).
5. **Three orphan or near-orphan models.** `stac_forui_toast.dart` is not exported from the public library (`stac_forui_components.dart`) but is a public-facing payload type for the `forui_show_toast` action — likely an oversight. `stac_forui_dialog_action_model.dart` and `stac_forui_sheet_action_model.dart` are also unexported (intentional — internal to action parsers).
6. **Theming direction adopted (2026-04-30):** Token-based theming with a client-owned palette registry — see §3.3 "Adopted: Token-Based Theming". Materially reduces the color-hex portion of P3 and should land **before** the (separate) Flatbuffers parser library is built, since it reshapes the schema from free-form strings to enum-friendly tokens.

---

## 3.2 Detailed Findings

### Proposal Issues (`stac-forui-components_plan.md`)

- **P1. Hook strategy unaddressed (plan §Goals, line 9).** The plan calls for "a strategy so forUI hooks can be used in the Stac framework." No such strategy or scaffolding exists in the code. The longer this is deferred, the more parsers will need to be revisited because hooks typically wrap or replace state-bearing widgets — and 30+ parsers are already in place.
- **P2. State-management strategy unaddressed (plan §Goals, line 10).** `forui` exposes both managed and uncontrolled state APIs. Today, parsers hard-code one path: `slider_parser.dart` uses `FSliderControl.managedContinuous()`, `calendar_parser.dart` uses `FCalendarControl.managedDate()`, etc. There is no model-level toggle (e.g., `controller: 'managed' | 'external'`). Retrofitting this means touching every stateful parser — non-trivial.
- **P3. Flatbuffers future-proofing only partial (plan §Deep Dive, lines 95–98).** Models are pure data holders (good), but several fields would not survive a Flatbuffers schema:
  - `stac_forui_toast.dart:16-17` — `dynamic title`, `dynamic description`. Untyped at the model layer; the action parser does runtime `is String` discrimination at `stac_forui_show_toast_action.dart:20-22, 26-28`. Should be a tagged union or two explicit fields.
  - All `onPress` / `onChange` action fields use `Map<String, dynamic>?` (e.g., `stac_forui_button.dart`, `stac_forui_switch.dart`, `stac_forui_text_field.dart`). Schema-flexible today, opaque to a binary protocol.
  - `stac_forui_theme.dart` typography uses `Map<String, dynamic>` for free-form style data.
  - `stac_forui_calendar.dart` uses `DateTime` directly rather than ISO-8601 strings or epoch ints.

  **Resolution path:** RT1–RT5 (see §3.3 "Adopted: Token-Based Theming") shifts color-bearing fields from hex strings to enum-friendly token names, materially reducing P3's surface area before the Flatbuffers parser library is built. The remaining concerns (action-payload typing, `dynamic` toast title, calendar `DateTime`) are still open and tracked under R3 / R4.
- **P4. Plan ambiguity / typos worth fixing.** Plan line 10: "Devices a strategy for the two forUI **statement** management options." Should read "Devise" / "state". Minor, but the plan is referenced by future contributors.
- **P5. Phase scope already exceeded.** The plan defines four phases with ~17 components total. The repo ships ~30. Phase tracking in the plan is stale and should be reconciled or replaced with a component matrix.

### Code Issues

#### Architecture / consistency (low risk — flagged for awareness)
- **C1. `dynamic`-typed payload in `stac_forui_toast.dart:16-17`.** The toast title and description accept either a string or a STAC widget JSON. The runtime check at `stac_forui_show_toast_action.dart:20-28` discriminates by `is String`. This is the only place in `lib/` that uses `dynamic`. Consider modeling as a sealed union or two explicit nullable fields (`titleText`, `titleWidget`).
- **C2. Unguarded `Stac.fromJson(nullable, ctx)` calls.** Several parsers pass nullable `Map<String, dynamic>?` straight into `Stac.fromJson` (e.g., `stac_forui_button_parser.dart:26-27` for `prefixIcon`/`suffixIcon`; `stac_forui_show_toast_action.dart:31` for `icon`). This relies on `Stac.fromJson` tolerating `null` and returning `null`. It does — but the contract is undocumented in this repo, so a STAC upgrade that changes this behavior would surface as null-deref panics across many call sites. Worth a thin local helper (`_parseOptional`) that makes the contract explicit.
- **C3. Per-component children-list parsing duplicated.** Multiple parsers iterate `model.children?.map((c) => Stac.fromJson(c, context))…` (sampled in tabs/accordion/select_group/tile_group). A shared helper would shrink each parser by 3–5 lines and centralize null filtering.

#### Registry / packaging (medium risk — easy wins)
- **C4. `stac_forui_toast.dart` not exported from public library.** `lib/stac_forui_components.dart` exports `stac_forui_toaster.dart` but not `stac_forui_toast.dart`. Since `StacForuiToast` is the public action payload for `forui_show_toast`, downstream Dart consumers cannot reference its type. Add an export.
- **C5. CHANGELOG is stale.** `CHANGELOG.md` lists `TextField`, `Scaffold`, `Header`, `Separator`, `Button` under `0.0.1`. It does not mention any of the ~25 components added since. Either bump versions and log, or add an "Unreleased" section.
- **C6. README is the Flutter scaffold stub.** Five `TODO:` placeholders, no installation snippet, no minimal STAC + forui example. Not a blocker pre-publish, but anyone discovering this repo cannot tell what it does.

#### Tests (medium risk)
- **C7. ~7 components without dedicated tests.** No tests for: `divider`, `header`, `popover`, `radio`, `toaster`, `tooltip`, `tooltip_group`, `collapsible`, `tile_group`. Some are covered indirectly via `stac_forui_models_test.dart` (JSON roundtrip), but no widget-tree or key-verification tests exist for them. (For comparison, every Phase 1–2 component has a dedicated widget test.)
- **C8. Action-callback testing inconsistent.** `button_test.dart` (73 LOC) and `switch_test.dart` (91 LOC) verify the action fires through a mock `StacAction`. `text_field_test.dart` (30 LOC) and `dialog_test.dart` (35 LOC) only verify parse + key. Adopt the button/switch pattern as the standard for any parser that wires callbacks.
- **C9. No analyzer enforcement of test conventions.** `analysis_options.yaml` includes only `package:flutter_lints/flutter.yaml`. No `prefer_relative_imports`, `public_member_api_docs`, `require_trailing_commas`, or `unawaited_futures` rules — all of which would catch real issues in a STAC integration package.

#### Documentation / hygiene (low risk, high cumulative cost)
- **C10. Zero `///` doc comments across `lib/src/`.** Verified: `grep -rn '^\s*///' lib/src | wc -l` = 0. Every public class is undocumented. For a package destined for `pub.dev`, this is a 0/30 documentation score on the pub scorecard. Fixing this is mechanical but grows ~linearly with the API surface — cheaper now than later.
- **C11. No examples directory.** Pub-published packages typically include `example/` with a runnable Flutter app demonstrating the integration. Absent here. The plan even mentions example STAC JSON ("Implementation Steps §3 → Iterative Development").

#### Security (no findings — for the record)
- No untrusted-string sanitization concerns: server-driven strings render via Flutter widgets (no XSS surface).
- Color parsing in `lib/src/utils/color_utils.dart` is bounded by `try`/`catch` with a black fallback — no panic risk on malformed hex.
- No network calls, no FFI, no `dart:io`-based file I/O in `lib/`. Attack surface is entirely the JSON schema, which is the consumer's trust boundary.

---

## 3.3 Recommendations

Tasks below are ordered by leverage (architectural risk first, then quick wins, then ongoing hygiene). Each is small enough to be a single PR.

### Adopted: Token-Based Theming (decided 2026-04-30)

**Decision.** Widgets reference *semantic color/typography tokens* (`"color": "primary"`, `"surface": "elevated"`, `"text": "muted"`), never hex values. The client owns a `Map<Token, Color>` palette and is the source of truth for the active theme. Theme switching = swap the palette → `FTheme` rebuilds → every parsed widget inherits the new values via `InheritedWidget`. **No round-trip to the server.**

**Why this and not the alternatives.**
- Aligns with `forui`'s existing `FColorScheme`, which is already semantic (not hex). We amplify the library rather than fight it.
- Dark mode, high-contrast, and brand overrides all become Map swaps — one mechanism, one mental model.
- The JSON schema becomes more enum-shaped, which is **strictly easier** for the eventual Flatbuffers parser library: an `enum ColorToken { primary, secondary, surface, … }` field is far cheaper than a per-widget free-form `string` color. Landing token-based theming **before** fbs schema work begins prevents a second migration.
- Owner explicitly favors simplicity: server should rarely, if ever, override theme. No per-component `colorOverride` escape hatch in v1.

**Tradeoff accepted.** Server can no longer say "this banner is exactly `#FF6B6B`" without adding the escape-hatch field. We are accepting that limitation in exchange for client-side switching, smaller binary payloads, and a cleaner fbs schema.

**Implementation tasks.**

- **RT1. Define the token vocabulary.** Mirror `FColorScheme` semantic names (`primary`, `primaryForeground`, `secondary`, `surface`, `mutedForeground`, `destructive`, `border`, …) plus typography tokens (`title`, `body`, `label`, …). Document in `lib/src/theme/tokens.dart` as a `sealed` class hierarchy or string-enum.
- **RT2. Build the client-side palette registry.** A `StacForuiThemePalette` holding `Map<ColorToken, Color>` exposed as a `ValueNotifier<StacForuiThemePalette>`. Apps own one instance and feed it to `StacForui.register(...)`. UI dark-mode toggles call the setter; the rest of the tree rebuilds for free.
- **RT3. Inventory & migrate color-bearing model fields.** Audit `stac_forui_theme.dart`, plus per-component variant fields likely affected: `badge` variants, `alert` variants, `card` styles, `button` styles. Replace `String` hex values with token-name strings. Existing `color_utils.dart` becomes "token resolver" rather than "hex parser."
- **RT4. Update `stac_forui_theme_parser.dart`** to construct `FThemeData` from the active palette via `InheritedWidget`/`Provider` lookup, not from JSON-provided hex values. The `StacForuiTheme` STAC widget can still ship a *palette delta* in JSON if a server-driven page needs to override a few tokens, but per-page custom palettes are deferred (no model field for it yet).
- **RT5. Replace `lib/src/utils/color_utils.dart`** hex-parsing extension with a token-resolution helper. Keep the `try`/`catch`-with-black-fallback safety property; tokens that don't resolve fall back to the parent palette, then to `FColorScheme` defaults.
- **RT6. Add a "swap-the-palette" widget test.** Render a tree, swap the palette, assert color changes propagate. This is the regression guard for the whole feature.
- **RT7. Document the token contract** in `documents/theme_tokens.md` (or similar). The eventual Flatbuffers library will consume the same vocabulary — this doc is the single source of truth across both libraries.

**Defers / out-of-scope (intentional).**
- Per-component `colorOverride: "#hex"` escape hatch. Re-evaluate only if a real CMS use case demands it.
- Per-page custom palettes shipped from the server. The architecture supports it (Map merge), but no model field exposes it yet.
- Animated theme transitions. Punt — `FTheme` rebuilds are good enough for v1.

### Architectural (do before more components are added)

- **R1. Decide and document the state-management strategy.** Before adding more stateful components (Phase 3+ already in flight), pick one of: (a) always managed, (b) always uncontrolled with STAC actions, (c) per-model `controller` field. Update the plan, then thread it through `slider_parser.dart`, `calendar_parser.dart`, `switch_parser.dart`, `text_field_parser.dart`, `checkbox_parser.dart`, `radio_parser.dart`, `select_group_parser.dart`, `tabs_parser.dart`. Doing this once across 8 parsers is much cheaper than retrofitting after 16.
- **R2. Decide on the hooks story.** Even a one-page ADR ("we will not bridge forui hooks because…" or "we will introduce a `StacHookBuilder` shim") prevents future churn.
- **R3. Tighten the action payload type.** Replace `Map<String, dynamic>?` action fields with a typed `StacActionRef` (still JSON-flexible underneath) so the model layer survives a Flatbuffers migration without a public-API break. Apply once in `stac_forui_button.dart`, then propagate.
- **R4. Replace `dynamic` with explicit fields in `stac_forui_toast.dart:16-17`.** Two nullable fields (`titleText: String?`, `titleWidget: Map<String, dynamic>?`) or a tagged union. Update `stac_forui_show_toast_action.dart:20-28` to drop the runtime `is String` check.

### Quick wins (one PR each)

- **R5. Add the missing public export** for `stac_forui_toast.dart` in `lib/stac_forui_components.dart`.
- **R6. Backfill widget tests** for `divider`, `header`, `popover`, `radio`, `toaster`, `tooltip`, `tooltip_group`, `collapsible`, `tile_group` — using `button_test.dart` / `switch_test.dart` as the template (parse + key + action firing).
- **R7. Extend `text_field_test.dart` and `dialog_test.dart`** to cover the action callbacks (`onChange`, `onSubmit`; dialog action buttons).
- **R8. Add a thin `_parseOptional(Map<String, dynamic>?, BuildContext)` helper** in `lib/src/utils/` and migrate the ~10 call sites that pass nullable maps to `Stac.fromJson`. Documents the contract; one place to change if STAC changes.

### Hygiene (treat as ongoing, not one-time)

- **R9. Tighten `analysis_options.yaml`.** Add at minimum: `public_member_api_docs`, `require_trailing_commas`, `unawaited_futures`, `avoid_dynamic_calls`. The first will surface every undocumented public class as a lint, making R10 trackable.
- **R10. Add `///` doc comments** to all public classes in `lib/src/models/` and `lib/src/parsers/`. One-line summary per class is sufficient; pub.dev's scorecard weights this heavily.
- **R11. Replace README scaffold with real content.** Minimum: install snippet, `StacForui.register()` call, one JSON → widget example, link to `documents/stac-forui-components_plan.md`.
- **R12. Add `example/`** — a minimal Flutter app rendering a STAC JSON tree with two or three forui components. This doubles as a smoke test.
- **R13. Update CHANGELOG** to reflect the ~25 components shipped since `0.0.1`. Adopt an "Unreleased" section going forward.

### Plan-document cleanup

- **R14. Reconcile the plan's phase list with reality.** Replace the static phase list (lines 36–60) with a component matrix (model ✓ / parser ✓ / test ✓ / docs ✓), or move it to a tracking issue. Fix typos on line 10.

---

## 4. Task Database Integration

The audit scope (§4) directs findings to `task_database.md`. This repo uses `.beads/` (per `documents/beads_agents.md`) rather than a flat markdown task DB. The 14 recommendations above (R1–R14) are intended to be opened as `beads` issues, with R1–R4 marked as architectural blockers for further Phase 3+ component work.
