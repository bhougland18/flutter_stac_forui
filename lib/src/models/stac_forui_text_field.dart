import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_text_field.g.dart';

@JsonSerializable()
class StacForuiTextField extends StacWidget {
  const StacForuiTextField({
    this.key,
    this.label,
    this.description,
    this.hint,
    this.error,
    this.prefix,
    this.suffix,
    this.obscureText = false,
    this.onChange,
    this.onSubmit,
  });

  final String? key;
  final String? label;
  final String? description;
  final String? hint;
  final String? error;
  final Map<String, dynamic>? prefix;
  final Map<String, dynamic>? suffix;
  final bool obscureText;
  final Map<String, dynamic>? onChange;
  final Map<String, dynamic>? onSubmit;

  factory StacForuiTextField.fromJson(Map<String, dynamic> json) =>
      _$StacForuiTextFieldFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiTextFieldToJson(this);
}
