import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_breadcrumb.g.dart';

@JsonSerializable()
class StacForuiBreadcrumb extends StacWidget {
  const StacForuiBreadcrumb({
    this.key,
    required this.children,
    this.divider,
  });

  final String? key;
  final List<Map<String, dynamic>> children;
  final Map<String, dynamic>? divider;

  factory StacForuiBreadcrumb.fromJson(Map<String, dynamic> json) =>
      _$StacForuiBreadcrumbFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiBreadcrumbToJson(this);
}

@JsonSerializable()
class StacForuiBreadcrumbItem extends StacWidget {
  const StacForuiBreadcrumbItem({
    this.key,
    required this.child,
    this.current = false,
    this.onPress,
  });

  final String? key;
  final Map<String, dynamic> child;
  final bool current;
  final Map<String, dynamic>? onPress;

  factory StacForuiBreadcrumbItem.fromJson(Map<String, dynamic> json) =>
      _$StacForuiBreadcrumbItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiBreadcrumbItemToJson(this);
}
