import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_switch.g.dart';

@JsonSerializable()
class StacForuiSwitch extends StacWidget {
  const StacForuiSwitch({
    this.key,
    this.label,
    this.description,
    this.value = false,
    this.enabled = true,
    this.onChanged,
    this.semanticLabel,
  });

  final String? key;
  final String? label;
  final String? description;
  final bool value;
  final bool enabled;
  final Map<String, dynamic>? onChanged;
  final String? semanticLabel;

  factory StacForuiSwitch.fromJson(Map<String, dynamic> json) =>
      _$StacForuiSwitchFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiSwitchToJson(this);
}
