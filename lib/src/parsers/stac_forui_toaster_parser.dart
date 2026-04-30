import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_toaster.dart';

class StacForuiToasterParser extends StacParser<StacForuiToaster> {
  const StacForuiToasterParser();

  @override
  String get type => 'forui_toaster';

  @override
  StacForuiToaster getModel(Map<String, dynamic> json) =>
      StacForuiToaster.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiToaster model) {
    return FToaster(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      child: Builder(
        builder: (context) =>
            Stac.fromJson(model.child, context) ?? const SizedBox.shrink(),
      ),
    );
  }
}
