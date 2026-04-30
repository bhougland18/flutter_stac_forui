// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_popover.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiPopover _$StacForuiPopoverFromJson(Map<String, dynamic> json) =>
    StacForuiPopover(
      key: json['key'] as String?,
      popover: json['popover'] as Map<String, dynamic>,
      child: json['child'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StacForuiPopoverToJson(StacForuiPopover instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'popover': instance.popover,
      'child': instance.child,
    };
