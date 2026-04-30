// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_dialog_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiDialogActionModel _$StacForuiDialogActionModelFromJson(
  Map<String, dynamic> json,
) => StacForuiDialogActionModel(
  dialog: json['dialog'] as Map<String, dynamic>,
  barrierDismissible: json['barrierDismissible'] as bool? ?? true,
);

Map<String, dynamic> _$StacForuiDialogActionModelToJson(
  StacForuiDialogActionModel instance,
) => <String, dynamic>{
  'dialog': instance.dialog,
  'barrierDismissible': instance.barrierDismissible,
};
