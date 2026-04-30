import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_resizable.dart';

class StacForuiResizableParser extends StacParser<StacForuiResizable> {
  const StacForuiResizableParser();

  @override
  String get type => 'forui_resizable';

  @override
  StacForuiResizable getModel(Map<String, dynamic> json) =>
      StacForuiResizable.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiResizable model) {
    return FResizable(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      axis: model.axis,
      crossAxisExtent: model.crossAxisExtent,
      children: model.children
          .map((region) => FResizableRegion(
                key: region.key != null ? ValueKey<String>(region.key!) : null,
                initialExtent: region.initialExtent,
                minExtent: region.minExtent,
                builder: (context, data, child) =>
                    Stac.fromJson(region.child, context) ??
                    const SizedBox.shrink(),
              ))
          .toList(),
    );
  }
}
