import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_divider.g.dart';

@JsonSerializable()
class StacForuiDivider extends StacWidget {
  const StacForuiDivider({
    this.key,
    this.axis = Axis.horizontal,
    this.color,
    this.width,
    this.padding,
  });

  final String? key;
  final Axis axis;
  final String? color;
  final double? width;
  final StacEdgeInsets? padding;

  factory StacForuiDivider.fromJson(Map<String, dynamic> json) =>
      _$StacForuiDividerFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiDividerToJson(this);
}
