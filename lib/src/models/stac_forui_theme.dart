import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/utils/color_utils.dart';

part 'stac_forui_theme.g.dart';

@JsonSerializable()
class StacForuiTheme extends StacWidget {
  const StacForuiTheme({
    required this.child,
    this.colors,
    this.typography,
    this.style,
  });

  final Map<String, dynamic>? child;
  final StacForuiColors? colors;
  final StacForuiTypography? typography;
  final StacForuiStyle? style;

  factory StacForuiTheme.fromJson(Map<String, dynamic> json) =>
      _$StacForuiThemeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiThemeToJson(this);
}

// ... StacForuiColors ...
// ... StacForuiTypography ...

@JsonSerializable()
class StacForuiStyle {
  const StacForuiStyle({
    this.borderRadius,
    this.borderWidth,
    this.touch = true,
  });

  final double? borderRadius;
  final double? borderWidth;
  final bool touch;

  factory StacForuiStyle.fromJson(Map<String, dynamic> json) =>
      _$StacForuiStyleFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiStyleToJson(this);

  FStyle toFStyle(
    FColors colors,
    FTypography typography,
  ) {
    final base = FStyle.inherit(
      colors: colors,
      typography: typography,
      touch: touch,
    );

    return FStyle(
      borderRadius: borderRadius != null
          ? base.borderRadius.copyWith(
              xs2: BorderRadius.circular(borderRadius!),
              xs: BorderRadius.circular(borderRadius!),
              sm: BorderRadius.circular(borderRadius!),
              md: BorderRadius.circular(borderRadius!),
              lg: BorderRadius.circular(borderRadius!),
              xl: BorderRadius.circular(borderRadius!),
              xl2: BorderRadius.circular(borderRadius!),
            )
          : base.borderRadius,
      borderWidth: borderWidth ?? base.borderWidth,
      formFieldStyle: base.formFieldStyle,
      focusedOutlineStyle: base.focusedOutlineStyle,
      iconStyle: base.iconStyle,
      tappableStyle: base.tappableStyle,
      sizes: base.sizes,
    );
  }
}

@JsonSerializable()
class StacForuiColors {
  const StacForuiColors({
    this.brightness = StacForuiBrightness.light,
    this.barrier,
    this.background,
    this.foreground,
    this.primary,
    this.primaryForeground,
    this.secondary,
    this.secondaryForeground,
    this.muted,
    this.mutedForeground,
    this.destructive,
    this.destructiveForeground,
    this.error,
    this.errorForeground,
    this.card,
    this.border,
  });

  final StacForuiBrightness brightness;
  final String? barrier;
  final String? background;
  final String? foreground;
  final String? primary;
  final String? primaryForeground;
  final String? secondary;
  final String? secondaryForeground;
  final String? muted;
  final String? mutedForeground;
  final String? destructive;
  final String? destructiveForeground;
  final String? error;
  final String? errorForeground;
  final String? card;
  final String? border;

  factory StacForuiColors.fromJson(Map<String, dynamic> json) =>
      _$StacForuiColorsFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiColorsToJson(this);

  FColors toFColors() {
    final base = brightness == StacForuiBrightness.light
        ? FColors.neutralLight
        : FColors.neutralDark;

    return base.copyWith(
      barrier: barrier?.toColor(),
      background: background?.toColor(),
      foreground: foreground?.toColor(),
      primary: primary?.toColor(),
      primaryForeground: primaryForeground?.toColor(),
      secondary: secondary?.toColor(),
      secondaryForeground: secondaryForeground?.toColor(),
      muted: muted?.toColor(),
      mutedForeground: mutedForeground?.toColor(),
      destructive: destructive?.toColor(),
      destructiveForeground: destructiveForeground?.toColor(),
      error: error?.toColor(),
      errorForeground: errorForeground?.toColor(),
      card: card?.toColor(),
      border: border?.toColor(),
    );
  }
}

enum StacForuiBrightness {
  light,
  dark;

  Brightness get toBrightness =>
      this == StacForuiBrightness.light ? Brightness.light : Brightness.dark;
}

@JsonSerializable()
class StacForuiTypography {
  const StacForuiTypography({
    this.fontFamily,
    this.touch = true,
    this.xs3,
    this.xs2,
    this.xs,
    this.sm,
    this.md,
    this.lg,
    this.xl,
    this.xl2,
    this.xl3,
    this.xl4,
    this.xl5,
    this.xl6,
    this.xl7,
    this.xl8,
  });

  final String? fontFamily;
  final bool touch;
  final Map<String, dynamic>? xs3;
  final Map<String, dynamic>? xs2;
  final Map<String, dynamic>? xs;
  final Map<String, dynamic>? sm;
  final Map<String, dynamic>? md;
  final Map<String, dynamic>? lg;
  final Map<String, dynamic>? xl;
  final Map<String, dynamic>? xl2;
  final Map<String, dynamic>? xl3;
  final Map<String, dynamic>? xl4;
  final Map<String, dynamic>? xl5;
  final Map<String, dynamic>? xl6;
  final Map<String, dynamic>? xl7;
  final Map<String, dynamic>? xl8;

  factory StacForuiTypography.fromJson(Map<String, dynamic> json) =>
      _$StacForuiTypographyFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiTypographyToJson(this);

  FTypography toFTypography(BuildContext context, FColors colors) {
    var typography = FTypography.inherit(
      colors: colors,
      fontFamily: fontFamily ?? FTypography.defaultFontFamily,
      touch: touch,
    );

    if (xs3 != null) {
      typography =
          typography.copyWith(xs3: StacTextStyle.fromJson(xs3).parse(context));
    }
    if (xs2 != null) {
      typography =
          typography.copyWith(xs2: StacTextStyle.fromJson(xs2).parse(context));
    }
    if (xs != null) {
      typography =
          typography.copyWith(xs: StacTextStyle.fromJson(xs).parse(context));
    }
    if (sm != null) {
      typography =
          typography.copyWith(sm: StacTextStyle.fromJson(sm).parse(context));
    }
    if (md != null) {
      typography =
          typography.copyWith(md: StacTextStyle.fromJson(md).parse(context));
    }
    if (lg != null) {
      typography =
          typography.copyWith(lg: StacTextStyle.fromJson(lg).parse(context));
    }
    if (xl != null) {
      typography =
          typography.copyWith(xl: StacTextStyle.fromJson(xl).parse(context));
    }
    if (xl2 != null) {
      typography =
          typography.copyWith(xl2: StacTextStyle.fromJson(xl2).parse(context));
    }
    if (xl3 != null) {
      typography =
          typography.copyWith(xl3: StacTextStyle.fromJson(xl3).parse(context));
    }
    if (xl4 != null) {
      typography =
          typography.copyWith(xl4: StacTextStyle.fromJson(xl4).parse(context));
    }
    if (xl5 != null) {
      typography =
          typography.copyWith(xl5: StacTextStyle.fromJson(xl5).parse(context));
    }
    if (xl6 != null) {
      typography =
          typography.copyWith(xl6: StacTextStyle.fromJson(xl6).parse(context));
    }
    if (xl7 != null) {
      typography =
          typography.copyWith(xl7: StacTextStyle.fromJson(xl7).parse(context));
    }
    if (xl8 != null) {
      typography =
          typography.copyWith(xl8: StacTextStyle.fromJson(xl8).parse(context));
    }

    return typography;
  }
}
