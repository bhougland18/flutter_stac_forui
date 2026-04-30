// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_theme.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiTheme _$StacForuiThemeFromJson(Map<String, dynamic> json) =>
    StacForuiTheme(
      child: json['child'] as Map<String, dynamic>?,
      colors: json['colors'] == null
          ? null
          : StacForuiColors.fromJson(json['colors'] as Map<String, dynamic>),
      typography: json['typography'] == null
          ? null
          : StacForuiTypography.fromJson(
              json['typography'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$StacForuiThemeToJson(StacForuiTheme instance) =>
    <String, dynamic>{
      'type': instance.type,
      'child': instance.child,
      'colors': instance.colors,
      'typography': instance.typography,
    };

StacForuiColors _$StacForuiColorsFromJson(Map<String, dynamic> json) =>
    StacForuiColors(
      brightness:
          $enumDecodeNullable(
            _$StacForuiBrightnessEnumMap,
            json['brightness'],
          ) ??
          StacForuiBrightness.light,
      barrier: json['barrier'] as String?,
      background: json['background'] as String?,
      foreground: json['foreground'] as String?,
      primary: json['primary'] as String?,
      primaryForeground: json['primaryForeground'] as String?,
      secondary: json['secondary'] as String?,
      secondaryForeground: json['secondaryForeground'] as String?,
      muted: json['muted'] as String?,
      mutedForeground: json['mutedForeground'] as String?,
      destructive: json['destructive'] as String?,
      destructiveForeground: json['destructiveForeground'] as String?,
      error: json['error'] as String?,
      errorForeground: json['errorForeground'] as String?,
      card: json['card'] as String?,
      border: json['border'] as String?,
    );

Map<String, dynamic> _$StacForuiColorsToJson(StacForuiColors instance) =>
    <String, dynamic>{
      'brightness': _$StacForuiBrightnessEnumMap[instance.brightness]!,
      'barrier': instance.barrier,
      'background': instance.background,
      'foreground': instance.foreground,
      'primary': instance.primary,
      'primaryForeground': instance.primaryForeground,
      'secondary': instance.secondary,
      'secondaryForeground': instance.secondaryForeground,
      'muted': instance.muted,
      'mutedForeground': instance.mutedForeground,
      'destructive': instance.destructive,
      'destructiveForeground': instance.destructiveForeground,
      'error': instance.error,
      'errorForeground': instance.errorForeground,
      'card': instance.card,
      'border': instance.border,
    };

const _$StacForuiBrightnessEnumMap = {
  StacForuiBrightness.light: 'light',
  StacForuiBrightness.dark: 'dark',
};

StacForuiTypography _$StacForuiTypographyFromJson(Map<String, dynamic> json) =>
    StacForuiTypography(fontFamily: json['fontFamily'] as String?);

Map<String, dynamic> _$StacForuiTypographyToJson(
  StacForuiTypography instance,
) => <String, dynamic>{'fontFamily': instance.fontFamily};
