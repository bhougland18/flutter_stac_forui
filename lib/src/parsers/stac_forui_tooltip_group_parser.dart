import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_tooltip_group.dart';

class StacForuiTooltipGroupParser extends StacParser<StacForuiTooltipGroup> {
  const StacForuiTooltipGroupParser();

  @override
  String get type => 'forui_tooltip_group';

  @override
  StacForuiTooltipGroup getModel(Map<String, dynamic> json) =>
      StacForuiTooltipGroup.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiTooltipGroup model) {
    return FTooltipGroup(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      child: Stac.fromJson(model.child, context) ?? const SizedBox.shrink(),
    );
  }
}
