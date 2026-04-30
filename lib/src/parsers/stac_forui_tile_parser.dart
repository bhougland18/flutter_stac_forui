import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_tile.dart';

class StacForuiTileParser extends StacParser<StacForuiTile> {
  const StacForuiTileParser();

  @override
  String get type => 'forui_tile';

  @override
  StacForuiTile getModel(Map<String, dynamic> json) =>
      StacForuiTile.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiTile model) {
    return FTile(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      title: Stac.fromJson(model.title, context) ?? const SizedBox.shrink(),
      subtitle: Stac.fromJson(model.subtitle, context),
      details: Stac.fromJson(model.details, context),
      prefix: Stac.fromJson(model.prefix, context),
      suffix: Stac.fromJson(model.suffix, context),
      onPress: model.onPress != null
          ? () => Stac.onCallFromJson(model.onPress, context)
          : null,
      enabled: model.enabled,
    );
  }
}
