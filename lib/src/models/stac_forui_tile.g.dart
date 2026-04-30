// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_tile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiTile _$StacForuiTileFromJson(Map<String, dynamic> json) =>
    StacForuiTile(
      key: json['key'] as String?,
      title: json['title'] as Map<String, dynamic>,
      subtitle: json['subtitle'] as Map<String, dynamic>?,
      details: json['details'] as Map<String, dynamic>?,
      prefix: json['prefix'] as Map<String, dynamic>?,
      suffix: json['suffix'] as Map<String, dynamic>?,
      onPress: json['onPress'] as Map<String, dynamic>?,
      enabled: json['enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$StacForuiTileToJson(StacForuiTile instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'title': instance.title,
      'subtitle': instance.subtitle,
      'details': instance.details,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
      'onPress': instance.onPress,
      'enabled': instance.enabled,
    };
