import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_theme.dart';
import 'package:stac_forui_components/src/utils/color_utils.dart';

class StacForuiThemeParser extends StacParser<StacForuiTheme> {
  const StacForuiThemeParser();

  @override
  String get type => 'forui_theme';

  @override
  StacForuiTheme getModel(Map<String, dynamic> json) =>
      StacForuiTheme.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiTheme model) {
    final colorScheme =
        model.colors?.toFColorScheme() ?? FTheme.of(context).colorScheme;
    return FTheme(
      data: FThemeData.inherit(
        colorScheme: colorScheme,
      ),
      child: Stac.fromJson(model.child, context) ?? const SizedBox.shrink(),
    );
  }
}
