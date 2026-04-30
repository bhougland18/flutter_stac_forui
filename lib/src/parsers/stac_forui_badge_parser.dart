import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_badge.dart';

class StacForuiBadgeParser extends StacParser<StacForuiBadge> {
  const StacForuiBadgeParser();

  @override
  String get type => 'forui_badge';

  @override
  StacForuiBadge getModel(Map<String, dynamic> json) =>
      StacForuiBadge.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiBadge model) {
    final Widget child = model.label != null
        ? Text(model.label!)
        : Stac.fromJson(model.rawLabel, context) ?? const SizedBox.shrink();

    return FBadge(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      variant: model.style.toFBadgeVariant,
      child: child,
    );
  }
}
