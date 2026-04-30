// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_collapsible.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiCollapsible _$StacForuiCollapsibleFromJson(
  Map<String, dynamic> json,
) => StacForuiCollapsible(
  key: json['key'] as String?,
  value: (json['value'] as num).toDouble(),
  child: json['child'] as Map<String, dynamic>,
);

Map<String, dynamic> _$StacForuiCollapsibleToJson(
  StacForuiCollapsible instance,
) => <String, dynamic>{
  'type': instance.type,
  'key': instance.key,
  'value': instance.value,
  'child': instance.child,
};
