import 'dart:async';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_toast.dart';

class StacForuiShowToastActionParser extends StacActionParser<StacForuiToast> {
  const StacForuiShowToastActionParser();

  @override
  String get actionType => 'forui_show_toast';

  @override
  StacForuiToast getModel(Map<String, dynamic> json) =>
      StacForuiToast.fromJson(json);

  @override
  FutureOr<void> onCall(BuildContext context, StacForuiToast model) {
    final title = model.title != null
        ? (model.title is String
            ? Text(model.title as String)
            : Stac.fromJson(model.title as Map<String, dynamic>, context))
        : null;

    final description = model.description != null
        ? (model.description is String
            ? Text(model.description as String)
            : Stac.fromJson(model.description as Map<String, dynamic>, context))
        : null;

    final icon = Stac.fromJson(model.icon, context);

    final variant = _mapVariant(model.variant);
    final alignment = _mapAlignment(model.alignment);

    showFToast(
      context: context,
      title: title ?? const SizedBox.shrink(),
      description: description,
      icon: icon,
      variant: variant,
      alignment: alignment,
      duration: model.duration != null
          ? Duration(milliseconds: model.duration!)
          : const Duration(seconds: 5),
    );
  }

  FToastVariant _mapVariant(String variant) {
    return switch (variant) {
      'destructive' => FToastVariant.destructive,
      _ => FToastVariant.primary,
    };
  }

  FToastAlignment? _mapAlignment(String? alignment) {
    return switch (alignment) {
      'topStart' => FToastAlignment.topStart,
      'topEnd' => FToastAlignment.topEnd,
      'topLeft' => FToastAlignment.topLeft,
      'topRight' => FToastAlignment.topRight,
      'topCenter' => FToastAlignment.topCenter,
      'bottomStart' => FToastAlignment.bottomStart,
      'bottomEnd' => FToastAlignment.bottomEnd,
      'bottomLeft' => FToastAlignment.bottomLeft,
      'bottomRight' => FToastAlignment.bottomRight,
      'bottomCenter' => FToastAlignment.bottomCenter,
      _ => null,
    };
  }
}
