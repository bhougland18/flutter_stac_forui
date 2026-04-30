import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_radio.dart';

class StacForuiRadioParser extends StacParser<StacForuiRadio> {
  const StacForuiRadioParser();

  @override
  String get type => 'forui_radio';

  @override
  StacForuiRadio getModel(Map<String, dynamic> json) =>
      StacForuiRadio.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiRadio model) {
    return FRadio(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      label: model.label != null ? Text(model.label!) : null,
      description: model.description != null ? Text(model.description!) : null,
      error: model.error != null ? Text(model.error!) : null,
      value: model.value,
      enabled: model.enabled,
      leadingLabel: model.leadingLabel,
      semanticsLabel: model.semanticLabel,
      onChange: model.enabled && model.onChange != null
          ? (value) => Stac.onCallFromJson(model.onChange, context)
          : null,
    );
  }
}
