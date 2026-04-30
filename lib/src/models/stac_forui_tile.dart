import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_tile.g.dart';

@JsonSerializable()
class StacForuiTile extends StacWidget {
  const StacForuiTile({
    this.key,
    required this.title,
    this.subtitle,
    this.details,
    this.prefix,
    this.suffix,
    this.onPress,
    this.enabled = true,
  });

  final String? key;
  final Map<String, dynamic> title;
  final Map<String, dynamic>? subtitle;
  final Map<String, dynamic>? details;
  final Map<String, dynamic>? prefix;
  final Map<String, dynamic>? suffix;
  final Map<String, dynamic>? onPress;
  final bool enabled;

  factory StacForuiTile.fromJson(Map<String, dynamic> json) =>
      _$StacForuiTileFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiTileToJson(this);
}
