import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_accordion.g.dart';

@JsonSerializable()
class StacForuiAccordion extends StacWidget {
  const StacForuiAccordion({
    this.key,
    required this.children,
    this.maxExpanded = 1,
  });

  final String? key;
  final List<Map<String, dynamic>> children;
  final int maxExpanded;

  factory StacForuiAccordion.fromJson(Map<String, dynamic> json) =>
      _$StacForuiAccordionFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiAccordionToJson(this);
}

@JsonSerializable()
class StacForuiAccordionItem extends StacWidget {
  const StacForuiAccordionItem({
    this.key,
    required this.title,
    required this.child,
    this.icon,
    this.initiallyExpanded,
  });

  final String? key;
  final Map<String, dynamic> title;
  final Map<String, dynamic> child;
  final Map<String, dynamic>? icon;
  final bool? initiallyExpanded;

  factory StacForuiAccordionItem.fromJson(Map<String, dynamic> json) =>
      _$StacForuiAccordionItemFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiAccordionItemToJson(this);
}
