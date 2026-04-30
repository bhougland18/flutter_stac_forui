import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_checkbox.dart';

class StacForuiCheckboxParser extends StacParser<StacForuiCheckbox> {
  const StacForuiCheckboxParser();

  @override
  String get type => 'forui_checkbox';

  @override
  StacForuiCheckbox getModel(Map<String, dynamic> json) =>
      StacForuiCheckbox.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiCheckbox model) {
    return FCheckbox(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      label: model.label != null ? Text(model.label!) : null,
      description: model.description != null ? Text(model.description!) : null,
      error: model.error != null ? Text(model.error!) : null,
      value: model.value,
      enabled: model.enabled,
      leadingLabel: model.leadingLabel,
      semanticsLabel: model.semanticLabel,
      onChange: model.onChange != null
          ? (value) => Stac.onCallFromJson(model.onChange, context)
          : null,
    );
  }
}
