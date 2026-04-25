import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_separator.dart';
import 'package:stac_forui_components/src/utils/color_utils.dart';

class StacForuiSeparatorParser extends StacParser<StacForuiSeparator> {
  const StacForuiSeparatorParser();

  @override
  String get type => 'forui_separator';

  @override
  StacForuiSeparator getModel(Map<String, dynamic> json) =>
      StacForuiSeparator.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiSeparator model) {
    final inherited = (model.vertical
        ? FTheme.of(context).separatorStyles.vertical
        : FTheme.of(context).separatorStyles.horizontal);

    return FSeparator(
      key: model.key != null ? ValueKey(model.key) : null,
      vertical: model.vertical,
      style: FSeparatorStyle(
        color: model.color?.toColor(inherited.color) ?? inherited.color,
        width: model.width ?? inherited.width,
        padding: model.padding?.parse ?? inherited.padding,
      ),
    );
  }
}
