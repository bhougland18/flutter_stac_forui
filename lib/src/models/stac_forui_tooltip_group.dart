import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_tooltip_group.g.dart';

@JsonSerializable()
class StacForuiTooltipGroup extends StacWidget {
  const StacForuiTooltipGroup({
    this.key,
    required this.child,
  });

  final String? key;
  final Map<String, dynamic> child;

  factory StacForuiTooltipGroup.fromJson(Map<String, dynamic> json) =>
      _$StacForuiTooltipGroupFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiTooltipGroupToJson(this);
}
