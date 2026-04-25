import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_header.g.dart';

@JsonSerializable()
class StacForuiHeader extends StacWidget {
  const StacForuiHeader({
    this.key,
    this.title,
    this.rawTitle,
    this.actions,
  });

  final String? key;
  final String? title;
  final Map<String, dynamic>? rawTitle;
  final List<Map<String, dynamic>>? actions;

  factory StacForuiHeader.fromJson(Map<String, dynamic> json) =>
      _$StacForuiHeaderFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiHeaderToJson(this);
}
