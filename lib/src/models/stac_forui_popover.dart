import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_popover.g.dart';

@JsonSerializable()
class StacForuiPopover extends StacWidget {
  const StacForuiPopover({
    this.key,
    required this.popover,
    this.child,
  });

  final String? key;
  final Map<String, dynamic> popover;
  final Map<String, dynamic>? child;

  factory StacForuiPopover.fromJson(Map<String, dynamic> json) =>
      _$StacForuiPopoverFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiPopoverToJson(this);
}
