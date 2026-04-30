// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_toast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiToast _$StacForuiToastFromJson(Map<String, dynamic> json) =>
    StacForuiToast(
      title: json['title'],
      description: json['description'],
      icon: json['icon'] as Map<String, dynamic>?,
      variant: json['variant'] as String? ?? 'primary',
      alignment: json['alignment'] as String?,
      duration: (json['duration'] as num?)?.toInt(),
    );

Map<String, dynamic> _$StacForuiToastToJson(StacForuiToast instance) =>
    <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
      'icon': instance.icon,
      'variant': instance.variant,
      'alignment': instance.alignment,
      'duration': instance.duration,
    };
