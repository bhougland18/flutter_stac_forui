import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_dialog.dart';

class StacForuiDialogParser extends StacParser<StacForuiDialog> {
  const StacForuiDialogParser();

  @override
  String get type => 'forui_dialog';

  @override
  StacForuiDialog getModel(Map<String, dynamic> json) =>
      StacForuiDialog.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiDialog model) {
    return FDialog(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      actions: model.actions
          .map((action) => Stac.fromJson(action, context))
          .whereType<Widget>()
          .toList(),
      title: model.title != null
          ? Text(model.title!)
          : Stac.fromJson(model.rawTitle, context),
      body: model.body != null
          ? Text(model.body!)
          : Stac.fromJson(model.rawBody, context),
      direction: model.axis,
    );
  }
}
