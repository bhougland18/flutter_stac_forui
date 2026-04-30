// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_resizable.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiResizable _$StacForuiResizableFromJson(Map<String, dynamic> json) =>
    StacForuiResizable(
      key: json['key'] as String?,
      axis: $enumDecodeNullable(_$AxisEnumMap, json['axis']) ?? Axis.horizontal,
      children: (json['children'] as List<dynamic>)
          .map(
            (e) => StacForuiResizableRegion.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
      crossAxisExtent: (json['crossAxisExtent'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$StacForuiResizableToJson(StacForuiResizable instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'axis': _$AxisEnumMap[instance.axis]!,
      'children': instance.children,
      'crossAxisExtent': instance.crossAxisExtent,
    };

const _$AxisEnumMap = {
  Axis.horizontal: 'horizontal',
  Axis.vertical: 'vertical',
};

StacForuiResizableRegion _$StacForuiResizableRegionFromJson(
  Map<String, dynamic> json,
) => StacForuiResizableRegion(
  initialExtent: (json['initialExtent'] as num).toDouble(),
  minExtent: (json['minExtent'] as num?)?.toDouble(),
  child: json['child'] as Map<String, dynamic>,
  key: json['key'] as String?,
);

Map<String, dynamic> _$StacForuiResizableRegionToJson(
  StacForuiResizableRegion instance,
) => <String, dynamic>{
  'initialExtent': instance.initialExtent,
  'minExtent': instance.minExtent,
  'child': instance.child,
  'key': instance.key,
};
