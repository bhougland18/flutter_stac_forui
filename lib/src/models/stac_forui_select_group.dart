import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_select_group.g.dart';

@JsonSerializable()
class StacForuiSelectGroup extends StacWidget {
  const StacForuiSelectGroup({
    this.key,
    required this.items,
    this.initialValues,
    this.label,
    this.description,
    this.onChanged,
    this.enabled = true,
  });

  final String? key;
  final List<StacForuiSelectGroupItem> items;
  final Set<String>? initialValues;
  final String? label;
  final String? description;
  final Map<String, dynamic>? onChanged;
  final bool enabled;

  factory StacForuiSelectGroup.fromJson(Map<String, dynamic> json) =>
      _$StacForuiSelectGroupFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiSelectGroupToJson(this);
}

@JsonSerializable()
class StacForuiSelectGroupItem {
  const StacForuiSelectGroupItem({
    required this.value,
    this.label,
    this.description,
    this.error,
    this.enabled = true,
    this.type = StacForuiSelectGroupItemType.checkbox,
  });

  final String value;
  final String? label;
  final String? description;
  final String? error;
  final bool enabled;
  final StacForuiSelectGroupItemType type;

  factory StacForuiSelectGroupItem.fromJson(Map<String, dynamic> json) =>
      _$StacForuiSelectGroupItemFromJson(json);

  Map<String, dynamic> toJson() => _$StacForuiSelectGroupItemToJson(this);
}

enum StacForuiSelectGroupItemType { checkbox, radio }
