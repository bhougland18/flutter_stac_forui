import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_card.g.dart';

@JsonSerializable()
class StacForuiCard extends StacWidget {
  const StacForuiCard({
    this.key,
    this.title,
    this.rawTitle,
    this.subtitle,
    this.rawSubtitle,
    this.child,
  });

  final String? key;
  final String? title;
  final Map<String, dynamic>? rawTitle;
  final String? subtitle;
  final Map<String, dynamic>? rawSubtitle;
  final Map<String, dynamic>? child;

  factory StacForuiCard.fromJson(Map<String, dynamic> json) =>
      _$StacForuiCardFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiCardToJson(this);
}
