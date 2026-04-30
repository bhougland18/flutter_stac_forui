// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_badge.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiBadge _$StacForuiBadgeFromJson(Map<String, dynamic> json) =>
    StacForuiBadge(
      key: json['key'] as String?,
      label: json['label'] as String?,
      rawLabel: json['rawLabel'] as Map<String, dynamic>?,
      style:
          $enumDecodeNullable(_$StacForuiBadgeStyleEnumMap, json['style']) ??
          StacForuiBadgeStyle.primary,
    );

Map<String, dynamic> _$StacForuiBadgeToJson(StacForuiBadge instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'label': instance.label,
      'rawLabel': instance.rawLabel,
      'style': _$StacForuiBadgeStyleEnumMap[instance.style]!,
    };

const _$StacForuiBadgeStyleEnumMap = {
  StacForuiBadgeStyle.primary: 'primary',
  StacForuiBadgeStyle.secondary: 'secondary',
  StacForuiBadgeStyle.outline: 'outline',
  StacForuiBadgeStyle.destructive: 'destructive',
};
