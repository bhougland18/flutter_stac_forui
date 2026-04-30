import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_breadcrumb.dart';

class StacForuiBreadcrumbParser extends StacParser<StacForuiBreadcrumb> {
  const StacForuiBreadcrumbParser();

  @override
  String get type => 'forui_breadcrumb';

  @override
  StacForuiBreadcrumb getModel(Map<String, dynamic> json) =>
      StacForuiBreadcrumb.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiBreadcrumb model) {
    return FBreadcrumb(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      divider: Stac.fromJson(model.divider, context),
      children: model.children
          .map((child) => Stac.fromJson(child, context))
          .whereType<Widget>()
          .toList(),
    );
  }
}

class StacForuiBreadcrumbItemParser extends StacParser<StacForuiBreadcrumbItem> {
  const StacForuiBreadcrumbItemParser();

  @override
  String get type => 'forui_breadcrumb_item';

  @override
  StacForuiBreadcrumbItem getModel(Map<String, dynamic> json) =>
      StacForuiBreadcrumbItem.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiBreadcrumbItem model) {
    return FBreadcrumbItem(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      current: model.current,
      onPress: model.onPress != null
          ? () => Stac.onCallFromJson(model.onPress, context)
          : null,
      child: Stac.fromJson(model.child, context) ?? const SizedBox.shrink(),
    );
  }
}
