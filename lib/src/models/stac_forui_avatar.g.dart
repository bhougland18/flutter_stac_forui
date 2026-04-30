// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_avatar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiAvatar _$StacForuiAvatarFromJson(Map<String, dynamic> json) =>
    StacForuiAvatar(
      key: json['key'] as String?,
      image: json['image'] as String?,
      size: (json['size'] as num?)?.toDouble() ?? 40.0,
      semanticsLabel: json['semanticsLabel'] as String?,
      fallback: json['fallback'] as Map<String, dynamic>?,
      child: json['child'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StacForuiAvatarToJson(StacForuiAvatar instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'image': instance.image,
      'size': instance.size,
      'semanticsLabel': instance.semanticsLabel,
      'fallback': instance.fallback,
      'child': instance.child,
    };
