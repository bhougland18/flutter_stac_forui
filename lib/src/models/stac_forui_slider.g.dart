// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_slider.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiSlider _$StacForuiSliderFromJson(Map<String, dynamic> json) =>
    StacForuiSlider(
      key: json['key'] as String?,
      label: json['label'] as String?,
      description: json['description'] as String?,
      min: (json['min'] as num?)?.toDouble() ?? 0.0,
      max: (json['max'] as num?)?.toDouble() ?? 1.0,
      initialMax: (json['initialMax'] as num?)?.toDouble() ?? 0.0,
      initialMin: (json['initialMin'] as num?)?.toDouble(),
      onEnd: json['onEnd'] as Map<String, dynamic>?,
      marks: (json['marks'] as List<dynamic>?)
          ?.map((e) => StacForuiSliderMark.fromJson(e as Map<String, dynamic>))
          .toList(),
      enabled: json['enabled'] as bool? ?? true,
      vertical: json['vertical'] as bool? ?? false,
    );

Map<String, dynamic> _$StacForuiSliderToJson(StacForuiSlider instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'label': instance.label,
      'description': instance.description,
      'min': instance.min,
      'max': instance.max,
      'initialMax': instance.initialMax,
      'initialMin': instance.initialMin,
      'onEnd': instance.onEnd,
      'marks': instance.marks,
      'enabled': instance.enabled,
      'vertical': instance.vertical,
    };

StacForuiSliderMark _$StacForuiSliderMarkFromJson(Map<String, dynamic> json) =>
    StacForuiSliderMark(
      value: (json['value'] as num).toDouble(),
      tick: json['tick'] as bool? ?? true,
      label: json['label'] as String?,
    );

Map<String, dynamic> _$StacForuiSliderMarkToJson(
  StacForuiSliderMark instance,
) => <String, dynamic>{
  'value': instance.value,
  'tick': instance.tick,
  'label': instance.label,
};
