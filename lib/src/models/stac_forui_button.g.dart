// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_button.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiButton _$StacForuiButtonFromJson(Map<String, dynamic> json) =>
    StacForuiButton(
      key: json['key'] as String?,
      label: json['label'] as String?,
      rawLabel: json['rawLabel'] as Map<String, dynamic>?,
      prefixIcon: json['prefixIcon'] as Map<String, dynamic>?,
      suffixIcon: json['suffixIcon'] as Map<String, dynamic>?,
      onPress: json['onPress'] as Map<String, dynamic>?,
      style:
          $enumDecodeNullable(_$StacForuiButtonStyleEnumMap, json['style']) ??
          StacForuiButtonStyle.primary,
      size:
          $enumDecodeNullable(_$StacForuiButtonSizeEnumMap, json['size']) ??
          StacForuiButtonSize.md,
      styleOverride: json['styleOverride'] == null
          ? null
          : StacForuiButtonStyleOverride.fromJson(
              json['styleOverride'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$StacForuiButtonToJson(StacForuiButton instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'label': instance.label,
      'rawLabel': instance.rawLabel,
      'prefixIcon': instance.prefixIcon,
      'suffixIcon': instance.suffixIcon,
      'onPress': instance.onPress,
      'style': _$StacForuiButtonStyleEnumMap[instance.style]!,
      'size': _$StacForuiButtonSizeEnumMap[instance.size]!,
      'styleOverride': instance.styleOverride,
    };

const _$StacForuiButtonStyleEnumMap = {
  StacForuiButtonStyle.primary: 'primary',
  StacForuiButtonStyle.secondary: 'secondary',
  StacForuiButtonStyle.outline: 'outline',
  StacForuiButtonStyle.destructive: 'destructive',
  StacForuiButtonStyle.ghost: 'ghost',
};

const _$StacForuiButtonSizeEnumMap = {
  StacForuiButtonSize.xs: 'xs',
  StacForuiButtonSize.sm: 'sm',
  StacForuiButtonSize.md: 'md',
  StacForuiButtonSize.lg: 'lg',
};

StacForuiButtonStyleOverride _$StacForuiButtonStyleOverrideFromJson(
  Map<String, dynamic> json,
) => StacForuiButtonStyleOverride(
  contentPadding: json['contentPadding'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$StacForuiButtonStyleOverrideToJson(
  StacForuiButtonStyleOverride instance,
) => <String, dynamic>{'contentPadding': instance.contentPadding};
