import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_progress.g.dart';

@JsonSerializable()
class StacForuiProgress extends StacWidget {
  const StacForuiProgress({
    this.key,
    this.value,
    this.semanticsLabel,
  });

  final String? key;
  final double? value;
  final String? semanticsLabel;

  factory StacForuiProgress.fromJson(Map<String, dynamic> json) =>
      _$StacForuiProgressFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiProgressToJson(this);
}
