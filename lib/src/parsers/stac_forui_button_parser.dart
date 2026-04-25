import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_button.dart';

class StacForuiButtonParser extends StacParser<StacForuiButton> {
  const StacForuiButtonParser();

  @override
  String get type => 'forui_button';

  @override
  StacForuiButton getModel(Map<String, dynamic> json) =>
      StacForuiButton.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiButton model) {
    return FButton(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      label: model.label,
      rawLabel: Stac.fromJson(model.rawLabel, context),
      prefixIcon: Stac.fromJson(model.prefixIcon, context),
      suffixIcon: Stac.fromJson(model.suffixIcon, context),
      style: model.style.toFButtonStyle,
      onPress: model.onPress != null
          ? () => Stac.onCallFromJson(model.onPress, context)
          : null,
    );
  }
}
