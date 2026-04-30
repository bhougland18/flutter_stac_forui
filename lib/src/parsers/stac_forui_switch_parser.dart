import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_switch.dart';

class StacForuiSwitchParser extends StacParser<StacForuiSwitch> {
  const StacForuiSwitchParser();

  @override
  String get type => 'forui_switch';

  @override
  StacForuiSwitch getModel(Map<String, dynamic> json) =>
      StacForuiSwitch.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiSwitch model) {
    return FSwitch(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      label: model.label != null ? Text(model.label!) : null,
      description: model.description != null ? Text(model.description!) : null,
      value: model.value,
      enabled: model.enabled,
      semanticsLabel: model.semanticLabel,
      onChange: model.enabled && (model.onChange ?? model.onChanged) != null
          ? (value) => Stac.onCallFromJson(model.onChange ?? model.onChanged, context)
          : null,
    );
  }
}
