// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_dialog.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiDialog _$StacForuiDialogFromJson(Map<String, dynamic> json) =>
    StacForuiDialog(
      key: json['key'] as String?,
      actions: (json['actions'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      title: json['title'] as String?,
      rawTitle: json['rawTitle'] as Map<String, dynamic>?,
      body: json['body'] as String?,
      rawBody: json['rawBody'] as Map<String, dynamic>?,
      axis: $enumDecodeNullable(_$AxisEnumMap, json['axis']) ?? Axis.vertical,
    );

Map<String, dynamic> _$StacForuiDialogToJson(StacForuiDialog instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'actions': instance.actions,
      'title': instance.title,
      'rawTitle': instance.rawTitle,
      'body': instance.body,
      'rawBody': instance.rawBody,
      'axis': _$AxisEnumMap[instance.axis]!,
    };

const _$AxisEnumMap = {
  Axis.horizontal: 'horizontal',
  Axis.vertical: 'vertical',
};
