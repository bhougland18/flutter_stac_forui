import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_avatar.dart';

class StacForuiAvatarParser extends StacParser<StacForuiAvatar> {
  const StacForuiAvatarParser();

  @override
  String get type => 'forui_avatar';

  @override
  StacForuiAvatar getModel(Map<String, dynamic> json) =>
      StacForuiAvatar.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiAvatar model) {
    if (model.image != null) {
      return FAvatar(
        key: model.key != null ? ValueKey<String>(model.key!) : null,
        image: NetworkImage(model.image!),
        size: model.size,
        semanticsLabel: model.semanticsLabel,
        fallback: Stac.fromJson(model.fallback, context),
      );
    } else {
      return FAvatar.raw(
        key: model.key != null ? ValueKey<String>(model.key!) : null,
        size: model.size,
        child: Stac.fromJson(model.child, context),
      );
    }
  }
}
