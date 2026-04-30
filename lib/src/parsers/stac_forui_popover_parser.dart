import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_popover.dart';

class StacForuiPopoverParser extends StacParser<StacForuiPopover> {
  const StacForuiPopoverParser();

  @override
  String get type => 'forui_popover';

  @override
  StacForuiPopover getModel(Map<String, dynamic> json) =>
      StacForuiPopover.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiPopover model) {
    return FPopover(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      popoverBuilder: (context, _) =>
          Stac.fromJson(model.popover, context) ?? const SizedBox.shrink(),
      child: Stac.fromJson(model.child, context),
    );
  }
}
