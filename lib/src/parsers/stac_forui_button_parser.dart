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
    final Widget? labelWidget = model.label != null
        ? Text(model.label!)
        : Stac.fromJson(model.rawLabel, context);

    return FButton(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      variant: model.style.toFButtonVariant,
      size: model.size.toFButtonSizeVariant,
      prefix: Stac.fromJson(model.prefixIcon, context),
      suffix: Stac.fromJson(model.suffixIcon, context),
      onPress: model.onPress != null
          ? () => Stac.onCallFromJson(model.onPress, context)
          : null,
      style: model.styleOverride?.toFButtonStyleDelta(context) ??
          const FButtonStyleDelta.context(),
      child: labelWidget,
    );
  }
}
