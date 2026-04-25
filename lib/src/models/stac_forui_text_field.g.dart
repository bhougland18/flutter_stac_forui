// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_text_field.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiTextField _$StacForuiTextFieldFromJson(Map<String, dynamic> json) =>
    StacForuiTextField(
      key: json['key'] as String?,
      label: json['label'] as String?,
      description: json['description'] as String?,
      hint: json['hint'] as String?,
      error: json['error'] as String?,
      prefix: json['prefix'] as Map<String, dynamic>?,
      suffix: json['suffix'] as Map<String, dynamic>?,
      obscureText: json['obscureText'] as bool? ?? false,
      onChange: json['onChange'] as Map<String, dynamic>?,
      onSubmit: json['onSubmit'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StacForuiTextFieldToJson(StacForuiTextField instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'label': instance.label,
      'description': instance.description,
      'hint': instance.hint,
      'error': instance.error,
      'prefix': instance.prefix,
      'suffix': instance.suffix,
      'obscureText': instance.obscureText,
      'onChange': instance.onChange,
      'onSubmit': instance.onSubmit,
    };
