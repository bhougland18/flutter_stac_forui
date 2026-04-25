# Agent Handoff: STAC forui Components Integration

## 1. Current Status
- **Current Task:** Implementing `FSwitch` model and parser (Issue: `stac-forui-components-i4u.4`). Status set to `in_progress`.
- **Recently Completed:** `FTextField` model and parser implementation (Issue: `stac-forui-components-i4u.3`).
- **Phase:** Phase 2 - Basic Inputs & Actions.

## 2. Environment & Tooling (Crucial)
### Nix Configuration
- Fixed a bug in `flake.nix` where `ai-tools` was used instead of `ai_tools`. 
- **Note:** `ai_tools` is currently explicitly **disabled** (`lib.mkForce false`) in `flake.nix` to bypass evaluation errors related to missing `codex` attribute in the upstream `nix-config`.

### Flutter SDK Mirror
- The environment requires a writable Flutter SDK mirror because the Nix store version is read-only and causes issues with `pub get` and `build_runner`.
- **Bootstrap:** Always run `./scripts/bootstrap-dev-workspace.sh` if the environment is reset.
- **Patched Logic:** I updated the bootstrap script to correctly break symlinks for `artifacts`, `engine`, and `linux-x64/flutter_tester`. It now also links all other necessary items from the Nix store's `bin/cache`.
- **Flutter Tester:** A patched version of `flutter_tester` is maintained in `.cache/flutter-tester-patched`.

## 3. Implementation Details
### StacForuiTextField
- Mapped properties: `label`, `description` (maps to `help`), `hint`, `error`, `obscureText`.
- **Actions:** Supports `onChange` and `onSubmit` via `StacAction`.
- **Keys:** Since `FTextField` (0.1.0) does not support a `key` parameter in its constructor, I wrapped it in a `KeyedSubtree` in the parser to maintain compatibility with `Patrol` and automated testing.

### Component Registry
- All new components are registered in `lib/src/registry/stac_forui.dart`.
- Exports are added to `lib/stac_forui_components.dart`.

## 4. Testing
- **Standard Pattern:**
  - Model tests in `test/stac_forui_models_test.dart` (JSON serialization).
  - Widget tests in `test/stac_forui_text_field_test.dart` (Parsing and Key verification).
- **Test Utilities:** Fixed `test/stac_forui_test_utils.dart` to move `FTheme` inside `MaterialApp` to resolve `Directionality` errors during tests.
- **Key Verification:** Updated all parsers (`Scaffold`, `Button`, `TextField`) to use explicit `ValueKey<String>(model.key!)` to avoid type mismatch errors in tests.

## 5. Next Steps
1. **Complete `FSwitch`:**
   - Define `StacForuiSwitch` model.
   - Implement `StacForuiSwitchParser` (Check if `FSwitch` supports `key`; if not, use `KeyedSubtree`).
   - Register and test.
2. **Phase 2 Remainder:**
   - `FCheckbox` (Verify availability in `forui` 0.1.0; it might be missing or named differently).
   - `FSlider` (Verify availability).
3. **Phase 3:** Data Presentation components (`FCard`, `FAvatar`, etc.).
