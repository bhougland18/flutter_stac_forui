import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_scaffold.dart';
import 'package:stac_forui_components/src/utils/color_utils.dart';
import 'package:stac_forui_components/src/models/stac_forui_theme.dart'; // Add this for toColor to work if needed, though it's on String

class StacForuiScaffoldParser extends StacParser<StacForuiScaffold> {
  const StacForuiScaffoldParser();

  @override
  String get type => 'forui_scaffold';

  @override
  StacForuiScaffold getModel(Map<String, dynamic> json) =>
      StacForuiScaffold.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiScaffold model) {
    return FScaffold(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      header: Stac.fromJson(model.header, context),
      content: Stac.fromJson(model.content, context) ?? const SizedBox.shrink(),
      footer: Stac.fromJson(model.footer, context),
      style: model.style?.toFScaffoldStyle(context),
    );
  }
}
