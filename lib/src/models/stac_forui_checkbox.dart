import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_checkbox.g.dart';

@JsonSerializable()
class StacForuiCheckbox extends StacWidget {
  const StacForuiCheckbox({
    this.key,
    this.label,
    this.description,
    this.error,
    this.value = false,
    this.enabled = true,
    this.onChange,
    this.leadingLabel = false,
    this.semanticLabel,
  });

  final String? key;
  final String? label;
  final String? description;
  final String? error;
  final bool value;
  final bool enabled;
  final Map<String, dynamic>? onChange;
  final bool leadingLabel;
  final String? semanticLabel;

  factory StacForuiCheckbox.fromJson(Map<String, dynamic> json) =>
      _$StacForuiCheckboxFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiCheckboxToJson(this);
}
