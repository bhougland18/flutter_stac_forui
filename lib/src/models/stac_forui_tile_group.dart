import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_tile_group.g.dart';

@JsonSerializable()
class StacForuiTileGroup extends StacWidget {
  const StacForuiTileGroup({
    this.key,
    required this.children,
    this.label,
    this.description,
    this.error,
    this.enabled = true,
  });

  final String? key;
  final List<Map<String, dynamic>> children;
  final Map<String, dynamic>? label;
  final Map<String, dynamic>? description;
  final Map<String, dynamic>? error;
  final bool enabled;

  factory StacForuiTileGroup.fromJson(Map<String, dynamic> json) =>
      _$StacForuiTileGroupFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiTileGroupToJson(this);
}
