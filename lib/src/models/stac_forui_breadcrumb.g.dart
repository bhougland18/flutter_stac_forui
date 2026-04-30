// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_breadcrumb.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiBreadcrumb _$StacForuiBreadcrumbFromJson(Map<String, dynamic> json) =>
    StacForuiBreadcrumb(
      key: json['key'] as String?,
      children: (json['children'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      divider: json['divider'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StacForuiBreadcrumbToJson(
  StacForuiBreadcrumb instance,
) => <String, dynamic>{
  'type': instance.type,
  'key': instance.key,
  'children': instance.children,
  'divider': instance.divider,
};

StacForuiBreadcrumbItem _$StacForuiBreadcrumbItemFromJson(
  Map<String, dynamic> json,
) => StacForuiBreadcrumbItem(
  key: json['key'] as String?,
  child: json['child'] as Map<String, dynamic>,
  current: json['current'] as bool? ?? false,
  onPress: json['onPress'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$StacForuiBreadcrumbItemToJson(
  StacForuiBreadcrumbItem instance,
) => <String, dynamic>{
  'type': instance.type,
  'key': instance.key,
  'child': instance.child,
  'current': instance.current,
  'onPress': instance.onPress,
};
