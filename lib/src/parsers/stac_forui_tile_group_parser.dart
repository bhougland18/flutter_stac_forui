import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_tile_group.dart';

class StacForuiTileGroupParser extends StacParser<StacForuiTileGroup> {
  const StacForuiTileGroupParser();

  @override
  String get type => 'forui_tile_group';

  @override
  StacForuiTileGroup getModel(Map<String, dynamic> json) =>
      StacForuiTileGroup.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiTileGroup model) {
    return FTileGroup(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      label: Stac.fromJson(model.label, context),
      description: Stac.fromJson(model.description, context),
      error: Stac.fromJson(model.error, context),
      enabled: model.enabled,
      children: model.children
          .map((child) => Stac.fromJson(child, context))
          .whereType<FTileMixin>()
          .toList(),
    );
  }
}
