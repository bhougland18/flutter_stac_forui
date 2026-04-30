import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_avatar.g.dart';

@JsonSerializable()
class StacForuiAvatar extends StacWidget {
  const StacForuiAvatar({
    this.key,
    this.image,
    this.size = 40.0,
    this.semanticsLabel,
    this.fallback,
    this.child,
  });

  final String? key;
  final String? image;
  final double size;
  final String? semanticsLabel;
  final Map<String, dynamic>? fallback;
  final Map<String, dynamic>? child;

  factory StacForuiAvatar.fromJson(Map<String, dynamic> json) =>
      _$StacForuiAvatarFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiAvatarToJson(this);
}
