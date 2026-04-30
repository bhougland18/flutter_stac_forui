import 'package:json_annotation/json_annotation.dart';

part 'stac_forui_dialog_action_model.g.dart';

@JsonSerializable()
class StacForuiDialogActionModel {
  const StacForuiDialogActionModel({
    required this.dialog,
    this.barrierDismissible = true,
  });

  final Map<String, dynamic> dialog;
  final bool barrierDismissible;

  factory StacForuiDialogActionModel.fromJson(Map<String, dynamic> json) =>
      _$StacForuiDialogActionModelFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiDialogActionModelToJson(this);
}
