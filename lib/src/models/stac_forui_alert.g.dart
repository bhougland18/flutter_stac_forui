// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_alert.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiAlert _$StacForuiAlertFromJson(Map<String, dynamic> json) =>
    StacForuiAlert(
      key: json['key'] as String?,
      title: json['title'] as String?,
      rawTitle: json['rawTitle'] as Map<String, dynamic>?,
      subtitle: json['subtitle'] as String?,
      rawSubtitle: json['rawSubtitle'] as Map<String, dynamic>?,
      icon: json['icon'] as Map<String, dynamic>?,
      variant:
          $enumDecodeNullable(
            _$StacForuiAlertVariantEnumMap,
            json['variant'],
          ) ??
          StacForuiAlertVariant.primary,
    );

Map<String, dynamic> _$StacForuiAlertToJson(StacForuiAlert instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'title': instance.title,
      'rawTitle': instance.rawTitle,
      'subtitle': instance.subtitle,
      'rawSubtitle': instance.rawSubtitle,
      'icon': instance.icon,
      'variant': _$StacForuiAlertVariantEnumMap[instance.variant]!,
    };

const _$StacForuiAlertVariantEnumMap = {
  StacForuiAlertVariant.primary: 'primary',
  StacForuiAlertVariant.destructive: 'destructive',
};
