import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_tooltip.dart';

class StacForuiTooltipParser extends StacParser<StacForuiTooltip> {
  const StacForuiTooltipParser();

  @override
  String get type => 'forui_tooltip';

  @override
  StacForuiTooltip getModel(Map<String, dynamic> json) =>
      StacForuiTooltip.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiTooltip model) {
    return FTooltip(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      tipBuilder: (context, _) =>
          Stac.fromJson(model.tip, context) ?? const SizedBox.shrink(),
      hover: model.hover,
      longPress: model.longPress,
      child: Stac.fromJson(model.child, context),
    );
  }
}
