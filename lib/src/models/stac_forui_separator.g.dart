// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_separator.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiSeparator _$StacForuiSeparatorFromJson(Map<String, dynamic> json) =>
    StacForuiSeparator(
      key: json['key'] as String?,
      vertical: json['vertical'] as bool? ?? false,
      color: json['color'] as String?,
      width: (json['width'] as num?)?.toDouble(),
      padding: json['padding'] == null
          ? null
          : StacEdgeInsets.fromJson(json['padding']),
    );

Map<String, dynamic> _$StacForuiSeparatorToJson(StacForuiSeparator instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'vertical': instance.vertical,
      'color': instance.color,
      'width': instance.width,
      'padding': instance.padding,
    };
