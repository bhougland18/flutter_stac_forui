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
    this.size = StacForuiButtonSize.md,
  });

  final String? key;
  final String? label;
  final Map<String, dynamic>? rawLabel;
  final Map<String, dynamic>? prefixIcon;
  final Map<String, dynamic>? suffixIcon;
  final Map<String, dynamic>? onPress;
  final StacForuiButtonStyle style;
  final StacForuiButtonSize size;

  factory StacForuiButton.fromJson(Map<String, dynamic> json) =>
      _$StacForuiButtonFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiButtonToJson(this);
}

enum StacForuiButtonStyle {
  primary,
  secondary,
  outline,
  destructive,
  ghost;

  FButtonVariant get toFButtonVariant {
    return switch (this) {
      StacForuiButtonStyle.primary => FButtonVariant.primary,
      StacForuiButtonStyle.secondary => FButtonVariant.secondary,
      StacForuiButtonStyle.outline => FButtonVariant.outline,
      StacForuiButtonStyle.destructive => FButtonVariant.destructive,
      StacForuiButtonStyle.ghost => FButtonVariant.ghost,
    };
  }
}

enum StacForuiButtonSize {
  xs,
  sm,
  md,
  lg;

  FButtonSizeVariant get toFButtonSizeVariant {
    return switch (this) {
      StacForuiButtonSize.xs => FButtonSizeVariant.xs,
      StacForuiButtonSize.sm => FButtonSizeVariant.sm,
      StacForuiButtonSize.md => FButtonSizeVariant.md,
      StacForuiButtonSize.lg => FButtonSizeVariant.lg,
    };
  }
}
