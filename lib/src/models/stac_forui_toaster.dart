import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_toaster.g.dart';

@JsonSerializable()
class StacForuiToaster extends StacWidget {
  const StacForuiToaster({
    this.key,
    required this.child,
  });

  final String? key;
  final Map<String, dynamic> child;

  factory StacForuiToaster.fromJson(Map<String, dynamic> json) =>
      _$StacForuiToasterFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiToasterToJson(this);
}
