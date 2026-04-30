// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_sheet_action_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiSheetActionModel _$StacForuiSheetActionModelFromJson(
  Map<String, dynamic> json,
) => StacForuiSheetActionModel(
  content: json['content'] as Map<String, dynamic>,
  side: json['side'] as String? ?? 'bottom',
  barrierDismissible: json['barrierDismissible'] as bool? ?? true,
);

Map<String, dynamic> _$StacForuiSheetActionModelToJson(
  StacForuiSheetActionModel instance,
) => <String, dynamic>{
  'content': instance.content,
  'side': instance.side,
  'barrierDismissible': instance.barrierDismissible,
};
