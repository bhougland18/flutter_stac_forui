import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/utils/color_utils.dart';

part 'stac_forui_scaffold.g.dart';

@JsonSerializable()
class StacForuiScaffold extends StacWidget {
  const StacForuiScaffold({
    this.key,
    this.header,
    this.content,
    this.footer,
    this.style,
  });

  final String? key;
  final Map<String, dynamic>? header;
  final Map<String, dynamic>? content;
  final Map<String, dynamic>? footer;
  final StacForuiScaffoldStyle? style;

  factory StacForuiScaffold.fromJson(Map<String, dynamic> json) =>
      _$StacForuiScaffoldFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiScaffoldToJson(this);
}

@JsonSerializable()
class StacForuiScaffoldStyle {
  const StacForuiScaffoldStyle({
    this.backgroundColor,
  });

  final String? backgroundColor;

  factory StacForuiScaffoldStyle.fromJson(Map<String, dynamic> json) =>
      _$StacForuiScaffoldStyleFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiScaffoldStyleToJson(this);

  FScaffoldStyle toFScaffoldStyle(BuildContext context) {
    final theme = FTheme.of(context);
    final inherited = FScaffoldStyle.inherit(
      colorScheme: theme.colorScheme,
      style: theme.style,
    );

    return FScaffoldStyle(
      backgroundColor: backgroundColor?.toColor(inherited.backgroundColor) ??
          inherited.backgroundColor,
      contentPadding: inherited.contentPadding,
      headerDecoration: inherited.headerDecoration,
      footerDecoration: inherited.footerDecoration,
    );
  }
}
