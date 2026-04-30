import 'package:forui/forui.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_alert.g.dart';

@JsonSerializable()
class StacForuiAlert extends StacWidget {
  const StacForuiAlert({
    this.key,
    this.title,
    this.rawTitle,
    this.subtitle,
    this.rawSubtitle,
    this.icon,
    this.variant = StacForuiAlertVariant.primary,
  });

  final String? key;
  final String? title;
  final Map<String, dynamic>? rawTitle;
  final String? subtitle;
  final Map<String, dynamic>? rawSubtitle;
  final Map<String, dynamic>? icon;
  final StacForuiAlertVariant variant;

  factory StacForuiAlert.fromJson(Map<String, dynamic> json) =>
      _$StacForuiAlertFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiAlertToJson(this);
}

enum StacForuiAlertVariant {
  primary,
  destructive;

  FAlertVariant get toFAlertVariant {
    return switch (this) {
      StacForuiAlertVariant.primary => FAlertVariant.primary,
      StacForuiAlertVariant.destructive => FAlertVariant.destructive,
    };
  }
}
