// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_checkbox.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiCheckbox _$StacForuiCheckboxFromJson(Map<String, dynamic> json) =>
    StacForuiCheckbox(
      key: json['key'] as String?,
      label: json['label'] as String?,
      description: json['description'] as String?,
      error: json['error'] as String?,
      value: json['value'] as bool? ?? false,
      enabled: json['enabled'] as bool? ?? true,
      onChange: json['onChange'] as Map<String, dynamic>?,
      leadingLabel: json['leadingLabel'] as bool? ?? false,
      semanticLabel: json['semanticLabel'] as String?,
    );

Map<String, dynamic> _$StacForuiCheckboxToJson(StacForuiCheckbox instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'label': instance.label,
      'description': instance.description,
      'error': instance.error,
      'value': instance.value,
      'enabled': instance.enabled,
      'onChange': instance.onChange,
      'leadingLabel': instance.leadingLabel,
      'semanticLabel': instance.semanticLabel,
    };
