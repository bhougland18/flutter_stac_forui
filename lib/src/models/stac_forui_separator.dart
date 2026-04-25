import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_separator.g.dart';

@JsonSerializable()
class StacForuiSeparator extends StacWidget {
  const StacForuiSeparator({
    this.key,
    this.vertical = false,
    this.color,
    this.width,
    this.padding,
  });

  final String? key;
  final bool vertical;
  final String? color;
  final double? width;
  final StacEdgeInsets? padding;

  factory StacForuiSeparator.fromJson(Map<String, dynamic> json) =>
      _$StacForuiSeparatorFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiSeparatorToJson(this);
}
