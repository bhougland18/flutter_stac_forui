import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_collapsible.g.dart';

@JsonSerializable()
class StacForuiCollapsible extends StacWidget {
  const StacForuiCollapsible({
    this.key,
    required this.value,
    required this.child,
  });

  final String? key;
  final double value;
  final Map<String, dynamic> child;

  factory StacForuiCollapsible.fromJson(Map<String, dynamic> json) =>
      _$StacForuiCollapsibleFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiCollapsibleToJson(this);
}
