// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_tile_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiTileGroup _$StacForuiTileGroupFromJson(Map<String, dynamic> json) =>
    StacForuiTileGroup(
      key: json['key'] as String?,
      children: (json['children'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      label: json['label'] as Map<String, dynamic>?,
      description: json['description'] as Map<String, dynamic>?,
      error: json['error'] as Map<String, dynamic>?,
      enabled: json['enabled'] as bool? ?? true,
    );

Map<String, dynamic> _$StacForuiTileGroupToJson(StacForuiTileGroup instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'children': instance.children,
      'label': instance.label,
      'description': instance.description,
      'error': instance.error,
      'enabled': instance.enabled,
    };
