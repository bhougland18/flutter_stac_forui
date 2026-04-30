// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_switch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiSwitch _$StacForuiSwitchFromJson(Map<String, dynamic> json) =>
    StacForuiSwitch(
      key: json['key'] as String?,
      label: json['label'] as String?,
      description: json['description'] as String?,
      value: json['value'] as bool? ?? false,
      enabled: json['enabled'] as bool? ?? true,
      onChange: json['onChange'] as Map<String, dynamic>?,
      onChanged: json['onChanged'] as Map<String, dynamic>?,
      semanticLabel: json['semanticLabel'] as String?,
    );

Map<String, dynamic> _$StacForuiSwitchToJson(StacForuiSwitch instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'label': instance.label,
      'description': instance.description,
      'value': instance.value,
      'enabled': instance.enabled,
      'onChange': instance.onChange,
      'onChanged': instance.onChanged,
      'semanticLabel': instance.semanticLabel,
    };
