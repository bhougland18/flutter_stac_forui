import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_theme.dart';

class StacForuiThemeParser extends StacParser<StacForuiTheme> {
  const StacForuiThemeParser();

  @override
  String get type => 'forui_theme';

  @override
  StacForuiTheme getModel(Map<String, dynamic> json) =>
      StacForuiTheme.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiTheme model) {
    final parentData = FTheme.of(context);
    final colors = model.colors?.toFColors() ?? parentData.colors;
    final typography = parentData.typography; // TODO: Support typography parsing
    final style = parentData.style;

    return FTheme(
      data: FThemeData(
        colors: colors,
        typography: typography,
        style: style,
        touch: true, // Default to touch-optimized
      ),
      child: Stac.fromJson(model.child, context) ?? const SizedBox.shrink(),
    );
  }
}
