import 'package:json_annotation/json_annotation.dart';

part 'stac_forui_sheet_action_model.g.dart';

@JsonSerializable()
class StacForuiSheetActionModel {
  const StacForuiSheetActionModel({
    required this.content,
    this.side = 'bottom',
    this.barrierDismissible = true,
  });

  final Map<String, dynamic> content;
  final String side;
  final bool barrierDismissible;

  factory StacForuiSheetActionModel.fromJson(Map<String, dynamic> json) =>
      _$StacForuiSheetActionModelFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiSheetActionModelToJson(this);
}
