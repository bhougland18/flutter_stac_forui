// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiCard _$StacForuiCardFromJson(Map<String, dynamic> json) =>
    StacForuiCard(
      key: json['key'] as String?,
      title: json['title'] as String?,
      rawTitle: json['rawTitle'] as Map<String, dynamic>?,
      subtitle: json['subtitle'] as String?,
      rawSubtitle: json['rawSubtitle'] as Map<String, dynamic>?,
      child: json['child'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StacForuiCardToJson(StacForuiCard instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'title': instance.title,
      'rawTitle': instance.rawTitle,
      'subtitle': instance.subtitle,
      'rawSubtitle': instance.rawSubtitle,
      'child': instance.child,
    };
