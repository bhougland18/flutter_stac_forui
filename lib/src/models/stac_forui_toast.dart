import 'package:json_annotation/json_annotation.dart';

part 'stac_forui_toast.g.dart';

@JsonSerializable()
class StacForuiToast {
  const StacForuiToast({
    required this.title,
    this.description,
    this.icon,
    this.variant = 'primary',
    this.alignment,
    this.duration,
  });

  final dynamic title;
  final dynamic description;
  final Map<String, dynamic>? icon;
  final String variant;
  final String? alignment;
  final int? duration;

  factory StacForuiToast.fromJson(Map<String, dynamic> json) =>
      _$StacForuiToastFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiToastToJson(this);
}
