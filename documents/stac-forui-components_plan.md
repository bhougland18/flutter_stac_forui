# STAC forui Components Integration Plan

This document outlines the strategy for creating a STAC (Server-Driven UI) [Stac] (https://github.com/StacDev/stac) (https://docs.stac.dev/concepts/custom_widgets) integration for the [forui](https://github.com/duobaseio/forui) component library.

## Goals
1. Provide a seamless way to use `forui` components within a STAC-powered Flutter application.
2. Map all core `forui` components to STAC models and parsers.
3. Ensure the integration is idiomatic to both STAC and `forui`.
4. Devise a strategy so forUI hooks can be used in the Stac framework
5. Devices a strategy for the two forUI statement management options

## Architecture

For each `forui` component, we will implement the following:

### 1. Data Model (`StacForui[ComponentName]`)
A Dart class that represents the serializable state of the component.
- Extends `StacWidget` (if applicable) or a base model class.
- Uses `json_serializable` for JSON parsing.
- Maps `forui` widget properties (e.g., `label`, `onPressed`, `style`) to JSON fields.

### 2. Parser (`StacForui[ComponentName]Parser`)
A class that implements the STAC parsing logic.
- Extends `StacParser<StacForui[ComponentName]>`.
- Overrides the `parse` method to return the actual `forui` Flutter widget.
- Handles nested STAC widgets (e.g., a `ForuiButton` containing a `StacIcon`).

### 3. Registry
A central registration mechanism to add all `forui` parsers to the `StacRegistry`.
- A static method `StacForui.register()` that takes a `StacRegistry` and adds all `forui` parsers.

## Component Mapping Strategy

We will prioritize the following component categories from `forui`:

### Phase 1: Foundation & Layout
- `FScaffold`
- `FHeader`
- `FDivider`
- `FResizable`

### Phase 2: Basic Inputs & Actions
- `FButton`
- `FTextField`
- `FCheckbox`
- `FSwitch`
- `FSlider`

### Phase 3: Data Presentation
- `FCard`
- `FAvatar`
- `FBadge`
- `FAccordion`
- `FItemGroup`

### Phase 4: Feedback & Overlays
- `FAlert`
- `FProgress`
- `FDialog` (as a STAC action or special widget)
- `FToast`

## Implementation Steps

1. **Setup Project Structure:**
   - Initialize a Flutter package.
   - Add dependencies: `stac`, `forui`, `json_annotation`, `json_serializable`, `build_runner`.

2. **Define Base Classes:**
   - Create a common prefix/namespace for all components (e.g., `f_` or `forui_` in JSON).

3. **Iterative Development:**
   - For each component:
     - Research the `forui` widget's API using the [LLM docs](https://forui.dev/docs/reference/llms).
     - Create the model and parser.
     - Add to the registry.
     - Create a test/example usage in a STAC JSON file.

4. **Validation:**
   - Ensure all `forui` themes and styles are accessible via STAC JSON.
   - Verify that events (like `onPressed`) can trigger STAC actions.

## Deep Dive: Theming & Actions

### 1. Theming Integration
`forui` uses a specialized `FTheme` system. To support this in STAC:
- **`StacForuiTheme`:** A new STAC widget/model that wraps its children in an `FTheme`.
- **Global Theme Support:** Update the `StacForui.register()` to optionally accept a default `FThemeData` or provide a way to parse it from the root STAC configuration.
- **Mapping:** We will map `forui`'s `FColorScheme` and `FTypography` to serializable STAC models.

### 2. Action Mapping
Every interactive `forui` component will support `StacAction`:
- **Callbacks:** Properties like `onPressed`, `onChanged`, and `onTap` will accept a `StacAction` object.
- **Execution:** The parser will use `Stac.onAction(context, action)` to trigger the server-defined behavior.

### 3. Flatbuffers Considerations (Future-Proofing)
- **Model Decoupling:** Keep `StacForui[Component]` models as pure data holders. This will simplify the transition to Flatbuffers-generated classes.
- **Binary Compatibility:** When designing the JSON schema for components, ensure field names and types are compatible with Flatbuffers primitives (e.g., using enums instead of arbitrary strings where possible).
- **Parser Agnosticism:** The component parsers should be designed to handle any object that implements a specific component interface, making them compatible with both JSON and Flatbuffers backends.
