import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_slider.g.dart';

@JsonSerializable()
class StacForuiSlider extends StacWidget {
  const StacForuiSlider({
    this.key,
    this.label,
    this.description,
    this.min = 0.0,
    this.max = 1.0,
    this.initialMax = 0.0,
    this.initialMin,
    this.onEnd,
    this.marks,
    this.enabled = true,
    this.vertical = false,
  });

  final String? key;
  final String? label;
  final String? description;
  final double min;
  final double max;
  final double initialMax;
  final double? initialMin;
  final Map<String, dynamic>? onEnd;
  final List<StacForuiSliderMark>? marks;
  final bool enabled;
  final bool vertical;

  factory StacForuiSlider.fromJson(Map<String, dynamic> json) =>
      _$StacForuiSliderFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiSliderToJson(this);
}

@JsonSerializable()
class StacForuiSliderMark {
  const StacForuiSliderMark({
    required this.value,
    this.tick = true,
    this.label,
  });

  final double value;
  final bool tick;
  final String? label;

  factory StacForuiSliderMark.fromJson(Map<String, dynamic> json) =>
      _$StacForuiSliderMarkFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiSliderMarkToJson(this);
}
