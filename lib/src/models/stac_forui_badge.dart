import 'package:forui/forui.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_badge.g.dart';

@JsonSerializable()
class StacForuiBadge extends StacWidget {
  const StacForuiBadge({
    this.key,
    this.label,
    this.rawLabel,
    this.style = StacForuiBadgeStyle.primary,
  });

  final String? key;
  final String? label;
  final Map<String, dynamic>? rawLabel;
  final StacForuiBadgeStyle style;

  factory StacForuiBadge.fromJson(Map<String, dynamic> json) =>
      _$StacForuiBadgeFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiBadgeToJson(this);
}

enum StacForuiBadgeStyle {
  primary,
  secondary,
  outline,
  destructive;

  FBadgeVariant get toFBadgeVariant {
    return switch (this) {
      StacForuiBadgeStyle.primary => FBadgeVariant.primary,
      StacForuiBadgeStyle.secondary => FBadgeVariant.secondary,
      StacForuiBadgeStyle.outline => FBadgeVariant.outline,
      StacForuiBadgeStyle.destructive => FBadgeVariant.destructive,
    };
  }
}
