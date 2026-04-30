// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_accordion.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiAccordion _$StacForuiAccordionFromJson(Map<String, dynamic> json) =>
    StacForuiAccordion(
      key: json['key'] as String?,
      children: (json['children'] as List<dynamic>)
          .map((e) => e as Map<String, dynamic>)
          .toList(),
      maxExpanded: (json['maxExpanded'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$StacForuiAccordionToJson(StacForuiAccordion instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'children': instance.children,
      'maxExpanded': instance.maxExpanded,
    };

StacForuiAccordionItem _$StacForuiAccordionItemFromJson(
  Map<String, dynamic> json,
) => StacForuiAccordionItem(
  key: json['key'] as String?,
  title: json['title'] as Map<String, dynamic>,
  child: json['child'] as Map<String, dynamic>,
  icon: json['icon'] as Map<String, dynamic>?,
  initiallyExpanded: json['initiallyExpanded'] as bool?,
);

Map<String, dynamic> _$StacForuiAccordionItemToJson(
  StacForuiAccordionItem instance,
) => <String, dynamic>{
  'type': instance.type,
  'key': instance.key,
  'title': instance.title,
  'child': instance.child,
  'icon': instance.icon,
  'initiallyExpanded': instance.initiallyExpanded,
};
