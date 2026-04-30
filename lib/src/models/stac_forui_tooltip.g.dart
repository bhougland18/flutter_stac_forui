// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_tooltip.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiTooltip _$StacForuiTooltipFromJson(Map<String, dynamic> json) =>
    StacForuiTooltip(
      key: json['key'] as String?,
      tip: json['tip'] as Map<String, dynamic>,
      child: json['child'] as Map<String, dynamic>?,
      hover: json['hover'] as bool?,
      longPress: json['longPress'] as bool?,
    );

Map<String, dynamic> _$StacForuiTooltipToJson(StacForuiTooltip instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'tip': instance.tip,
      'child': instance.child,
      'hover': instance.hover,
      'longPress': instance.longPress,
    };
