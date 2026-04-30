// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_tabs.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiTabs _$StacForuiTabsFromJson(Map<String, dynamic> json) =>
    StacForuiTabs(
      key: json['key'] as String?,
      tabs: (json['tabs'] as List<dynamic>?)
          ?.map((e) => StacForuiTabEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      entries: (json['entries'] as List<dynamic>?)
          ?.map((e) => StacForuiTabEntry.fromJson(e as Map<String, dynamic>))
          .toList(),
      initialIndex: (json['initialIndex'] as num?)?.toInt() ?? 0,
      scrollable: json['scrollable'] as bool? ?? false,
      onPress: json['onPress'] as Map<String, dynamic>?,
      onChange: json['onChange'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StacForuiTabsToJson(StacForuiTabs instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'tabs': instance.tabs,
      'entries': instance.entries,
      'initialIndex': instance.initialIndex,
      'scrollable': instance.scrollable,
      'onPress': instance.onPress,
      'onChange': instance.onChange,
    };

StacForuiTabEntry _$StacForuiTabEntryFromJson(Map<String, dynamic> json) =>
    StacForuiTabEntry(
      label: json['label'] as String?,
      rawLabel: json['rawLabel'] as Map<String, dynamic>?,
      content: json['content'] as Map<String, dynamic>?,
      child: json['child'] as Map<String, dynamic>?,
    );

Map<String, dynamic> _$StacForuiTabEntryToJson(StacForuiTabEntry instance) =>
    <String, dynamic>{
      'label': instance.label,
      'rawLabel': instance.rawLabel,
      'content': instance.content,
      'child': instance.child,
    };
