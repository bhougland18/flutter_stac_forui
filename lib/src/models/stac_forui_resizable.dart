import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_resizable.g.dart';

@JsonSerializable()
class StacForuiResizable extends StacWidget {
  const StacForuiResizable({
    this.key,
    this.axis = Axis.horizontal,
    required this.children,
    this.crossAxisExtent,
  });

  final String? key;
  final Axis axis;
  final List<StacForuiResizableRegion> children;
  final double? crossAxisExtent;

  factory StacForuiResizable.fromJson(Map<String, dynamic> json) =>
      _$StacForuiResizableFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiResizableToJson(this);
}

@JsonSerializable()
class StacForuiResizableRegion {
  const StacForuiResizableRegion({
    required this.initialExtent,
    this.minExtent,
    required this.child,
    this.key,
  });

  final double initialExtent;
  final double? minExtent;
  final Map<String, dynamic> child;
  final String? key;

  factory StacForuiResizableRegion.fromJson(Map<String, dynamic> json) =>
      _$StacForuiResizableRegionFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiResizableRegionToJson(this);
}
