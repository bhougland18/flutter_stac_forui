import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_dialog.g.dart';

@JsonSerializable()
class StacForuiDialog extends StacWidget {
  const StacForuiDialog({
    this.key,
    required this.actions,
    this.title,
    this.rawTitle,
    this.body,
    this.rawBody,
    this.axis = Axis.vertical,
  });

  final String? key;
  final List<Map<String, dynamic>> actions;
  final String? title;
  final Map<String, dynamic>? rawTitle;
  final String? body;
  final Map<String, dynamic>? rawBody;
  final Axis axis;

  factory StacForuiDialog.fromJson(Map<String, dynamic> json) =>
      _$StacForuiDialogFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiDialogToJson(this);
}
