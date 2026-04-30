import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_sheet_action_model.dart';

class StacForuiShowSheetActionParser
    extends StacActionParser<StacForuiSheetActionModel> {
  const StacForuiShowSheetActionParser();

  @override
  String get actionType => 'forui_show_sheet';

  @override
  StacForuiSheetActionModel getModel(Map<String, dynamic> json) =>
      StacForuiSheetActionModel.fromJson(json);

  @override
  FutureOr<void> onCall(BuildContext context, StacForuiSheetActionModel model) {
    final side = _mapLayout(model.side);

    showFSheet(
      context: context,
      side: side,
      builder: (context) {
        return Stac.fromJson(model.content, context) ?? const SizedBox.shrink();
      },
      barrierDismissible: model.barrierDismissible,
    );
  }

  FLayout _mapLayout(String layout) {
    return switch (layout) {
      'top' => FLayout.ttb,
      'bottom' => FLayout.btt,
      'left' => FLayout.ltr,
      'right' => FLayout.rtl,
      _ => FLayout.btt,
    };
  }
}
