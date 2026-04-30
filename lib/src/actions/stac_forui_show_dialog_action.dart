import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_dialog_action_model.dart';

class StacForuiShowDialogActionParser
    extends StacActionParser<StacForuiDialogActionModel> {
  const StacForuiShowDialogActionParser();

  @override
  String get actionType => 'forui_show_dialog';

  @override
  StacForuiDialogActionModel getModel(Map<String, dynamic> json) =>
      StacForuiDialogActionModel.fromJson(json);

  @override
  FutureOr<void> onCall(BuildContext context, StacForuiDialogActionModel model) {
    showFDialog(
      context: context,
      builder: (context, style, animation) {
        return Stac.fromJson(model.dialog, context) ?? const SizedBox.shrink();
      },
      barrierDismissible: model.barrierDismissible,
    );
  }
}
