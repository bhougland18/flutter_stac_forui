import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_select_group.dart';

class StacForuiSelectGroupParser extends StacParser<StacForuiSelectGroup> {
  const StacForuiSelectGroupParser();

  @override
  String get type => 'forui_select_group';

  @override
  StacForuiSelectGroup getModel(Map<String, dynamic> json) =>
      StacForuiSelectGroup.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiSelectGroup model) {
    return FSelectGroup<String>(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      label: model.label != null ? Text(model.label!) : null,
      description: model.description != null ? Text(model.description!) : null,
      enabled: model.enabled,
      control: FMultiValueControl.managed(
        initial: model.initialValues ?? {},
        onChange: (values) {
          if (model.onChanged != null) {
            Stac.onCallFromJson(model.onChanged, context);
          }
        },
      ),
      children: model.items.map((item) {
        if (item.type == StacForuiSelectGroupItemType.radio) {
          return FSelectGroupItemMixin.radio(
            value: item.value,
            label: item.label != null ? Text(item.label!) : null,
            description:
                item.description != null ? Text(item.description!) : null,
            error: item.error != null ? Text(item.error!) : null,
            enabled: item.enabled,
          );
        } else {
          return FSelectGroupItemMixin.checkbox(
            value: item.value,
            label: item.label != null ? Text(item.label!) : null,
            description:
                item.description != null ? Text(item.description!) : null,
            error: item.error != null ? Text(item.error!) : null,
            enabled: item.enabled,
          );
        }
      }).toList(),
    );
  }
}
