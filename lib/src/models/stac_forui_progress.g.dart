// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_progress.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiProgress _$StacForuiProgressFromJson(Map<String, dynamic> json) =>
    StacForuiProgress(
      key: json['key'] as String?,
      value: (json['value'] as num?)?.toDouble(),
      semanticsLabel: json['semanticsLabel'] as String?,
    );

Map<String, dynamic> _$StacForuiProgressToJson(StacForuiProgress instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'value': instance.value,
      'semanticsLabel': instance.semanticsLabel,
    };
