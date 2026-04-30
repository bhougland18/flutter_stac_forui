import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_divider.dart';
import 'package:stac_forui_components/src/utils/color_utils.dart';

class StacForuiDividerParser extends StacParser<StacForuiDivider> {
  const StacForuiDividerParser();

  @override
  String get type => 'forui_divider';

  @override
  StacForuiDivider getModel(Map<String, dynamic> json) =>
      StacForuiDivider.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiDivider model) {
    return FDivider(
      key: model.key != null ? ValueKey(model.key) : null,
      axis: model.axis,
      style: model.color != null || model.width != null || model.padding != null
          ? FDividerStyleDelta.delta(
              color: model.color?.toColor(),
              width: model.width,
              padding: model.padding?.parse != null
                  ? EdgeInsetsGeometryDelta.value(model.padding!.parse)
                  : null,
            )
          : const FDividerStyleDelta.context(),
    );
  }
}
