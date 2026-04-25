// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_header.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiHeader _$StacForuiHeaderFromJson(Map<String, dynamic> json) =>
    StacForuiHeader(
      key: json['key'] as String?,
      title: json['title'] as String?,
      rawTitle: json['rawTitle'] as Map<String, dynamic>?,
      actions: (json['actions'] as List<dynamic>?)
          ?.map((e) => e as Map<String, dynamic>)
          .toList(),
    );

Map<String, dynamic> _$StacForuiHeaderToJson(StacForuiHeader instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'title': instance.title,
      'rawTitle': instance.rawTitle,
      'actions': instance.actions,
    };
