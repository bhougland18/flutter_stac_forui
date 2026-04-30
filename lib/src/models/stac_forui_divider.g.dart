// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_divider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiDivider _$StacForuiDividerFromJson(Map<String, dynamic> json) =>
    StacForuiDivider(
      key: json['key'] as String?,
      axis: $enumDecodeNullable(_$AxisEnumMap, json['axis']) ?? Axis.horizontal,
      color: json['color'] as String?,
      width: (json['width'] as num?)?.toDouble(),
      padding: json['padding'] == null
          ? null
          : StacEdgeInsets.fromJson(json['padding']),
    );

Map<String, dynamic> _$StacForuiDividerToJson(StacForuiDivider instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'axis': _$AxisEnumMap[instance.axis]!,
      'color': instance.color,
      'width': instance.width,
      'padding': instance.padding,
    };

const _$AxisEnumMap = {
  Axis.horizontal: 'horizontal',
  Axis.vertical: 'vertical',
};
