import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_collapsible.dart';

class StacForuiCollapsibleParser extends StacParser<StacForuiCollapsible> {
  const StacForuiCollapsibleParser();

  @override
  String get type => 'forui_collapsible';

  @override
  StacForuiCollapsible getModel(Map<String, dynamic> json) =>
      StacForuiCollapsible.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiCollapsible model) {
    return FCollapsible(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      value: model.value,
      child: Stac.fromJson(model.child, context) ?? const SizedBox.shrink(),
    );
  }
}
