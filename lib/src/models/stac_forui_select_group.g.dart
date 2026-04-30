// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_select_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiSelectGroup _$StacForuiSelectGroupFromJson(
  Map<String, dynamic> json,
) => StacForuiSelectGroup(
  key: json['key'] as String?,
  items: (json['items'] as List<dynamic>)
      .map((e) => StacForuiSelectGroupItem.fromJson(e as Map<String, dynamic>))
      .toList(),
  initialValues: (json['initialValues'] as List<dynamic>?)
      ?.map((e) => e as String)
      .toSet(),
  label: json['label'] as String?,
  description: json['description'] as String?,
  onChanged: json['onChanged'] as Map<String, dynamic>?,
  enabled: json['enabled'] as bool? ?? true,
);

Map<String, dynamic> _$StacForuiSelectGroupToJson(
  StacForuiSelectGroup instance,
) => <String, dynamic>{
  'type': instance.type,
  'key': instance.key,
  'items': instance.items,
  'initialValues': instance.initialValues?.toList(),
  'label': instance.label,
  'description': instance.description,
  'onChanged': instance.onChanged,
  'enabled': instance.enabled,
};

StacForuiSelectGroupItem _$StacForuiSelectGroupItemFromJson(
  Map<String, dynamic> json,
) => StacForuiSelectGroupItem(
  value: json['value'] as String,
  label: json['label'] as String?,
  description: json['description'] as String?,
  error: json['error'] as String?,
  enabled: json['enabled'] as bool? ?? true,
  type:
      $enumDecodeNullable(
        _$StacForuiSelectGroupItemTypeEnumMap,
        json['type'],
      ) ??
      StacForuiSelectGroupItemType.checkbox,
);

Map<String, dynamic> _$StacForuiSelectGroupItemToJson(
  StacForuiSelectGroupItem instance,
) => <String, dynamic>{
  'value': instance.value,
  'label': instance.label,
  'description': instance.description,
  'error': instance.error,
  'enabled': instance.enabled,
  'type': _$StacForuiSelectGroupItemTypeEnumMap[instance.type]!,
};

const _$StacForuiSelectGroupItemTypeEnumMap = {
  StacForuiSelectGroupItemType.checkbox: 'checkbox',
  StacForuiSelectGroupItemType.radio: 'radio',
};
