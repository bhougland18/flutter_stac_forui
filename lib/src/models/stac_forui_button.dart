import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_button.g.dart';

@JsonSerializable()
class StacForuiButton extends StacWidget {
  const StacForuiButton({
    this.key,
    this.label,
    this.rawLabel,
    this.prefixIcon,
    this.suffixIcon,
    this.onPress,
    this.style = StacForuiButtonStyle.primary,
  });

  final String? key;
  final String? label;
  final Map<String, dynamic>? rawLabel;
  final Map<String, dynamic>? prefixIcon;
  final Map<String, dynamic>? suffixIcon;
  final Map<String, dynamic>? onPress;
  final StacForuiButtonStyle style;

  factory StacForuiButton.fromJson(Map<String, dynamic> json) =>
      _$StacForuiButtonFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiButtonToJson(this);
}

enum StacForuiButtonStyle {
  primary,
  secondary,
  outline,
  destructive;

  FButtonStyle get toFButtonStyle {
    return switch (this) {
      StacForuiButtonStyle.primary => FButtonStyle.primary,
      StacForuiButtonStyle.secondary => FButtonStyle.secondary,
      StacForuiButtonStyle.outline => FButtonStyle.outline,
      StacForuiButtonStyle.destructive => FButtonStyle.destructive,
    };
  }
}
