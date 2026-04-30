import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_tabs.g.dart';

@JsonSerializable()
class StacForuiTabs extends StacWidget {
  const StacForuiTabs({
    this.key,
    this.tabs,
    this.entries,
    this.initialIndex = 0,
    this.scrollable = false,
    this.onPress,
    this.onChange,
  });

  final String? key;
  final List<StacForuiTabEntry>? tabs;
  final List<StacForuiTabEntry>? entries;
  final int initialIndex;
  final bool scrollable;
  final Map<String, dynamic>? onPress;
  final Map<String, dynamic>? onChange;

  factory StacForuiTabs.fromJson(Map<String, dynamic> json) =>
      _$StacForuiTabsFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiTabsToJson(this);
}

@JsonSerializable()
class StacForuiTabEntry {
  const StacForuiTabEntry({
    this.label,
    this.rawLabel,
    this.content,
    this.child,
  });

  final String? label;
  final Map<String, dynamic>? rawLabel;
  final Map<String, dynamic>? content;
  final Map<String, dynamic>? child;

  factory StacForuiTabEntry.fromJson(Map<String, dynamic> json) =>
      _$StacForuiTabEntryFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiTabEntryToJson(this);
}
