import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_tooltip.g.dart';

@JsonSerializable()
class StacForuiTooltip extends StacWidget {
  const StacForuiTooltip({
    this.key,
    required this.tip,
    this.child,
    this.hover,
    this.longPress,
  });

  final String? key;
  final Map<String, dynamic> tip;
  final Map<String, dynamic>? child;
  final bool? hover;
  final bool? longPress;

  factory StacForuiTooltip.fromJson(Map<String, dynamic> json) =>
      _$StacForuiTooltipFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiTooltipToJson(this);
}
