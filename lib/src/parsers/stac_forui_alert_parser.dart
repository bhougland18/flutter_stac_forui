import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_alert.dart';

class StacForuiAlertParser extends StacParser<StacForuiAlert> {
  const StacForuiAlertParser();

  @override
  String get type => 'forui_alert';

  @override
  StacForuiAlert getModel(Map<String, dynamic> json) =>
      StacForuiAlert.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiAlert model) {
    final title = model.title != null
        ? Text(model.title!)
        : Stac.fromJson(model.rawTitle, context);

    return FAlert(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      title: title ?? const SizedBox.shrink(),
      subtitle: model.subtitle != null
          ? Text(model.subtitle!)
          : Stac.fromJson(model.rawSubtitle, context),
      icon: Stac.fromJson(model.icon, context) ?? const Icon(FIcons.circleAlert),
      variant: model.variant.toFAlertVariant,
    );
  }
}
