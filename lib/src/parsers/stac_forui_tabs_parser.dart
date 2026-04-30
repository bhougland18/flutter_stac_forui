import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_tabs.dart';

class StacForuiTabsParser extends StacParser<StacForuiTabs> {
  const StacForuiTabsParser();

  @override
  String get type => 'forui_tabs';

  @override
  StacForuiTabs getModel(Map<String, dynamic> json) =>
      StacForuiTabs.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiTabs model) {
    return FTabs(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      control: FTabControl.managed(
        initial: model.initialIndex,
        onChange: (model.onChange ?? model.onPress) != null
            ? (index) => Stac.onCallFromJson(
                  model.onChange ?? model.onPress,
                  context,
                )
            : null,
      ),
      children: (model.entries ?? model.tabs ?? [])
          .map((tab) => FTabEntry(
                label: tab.label != null
                    ? Text(tab.label!)
                    : Stac.fromJson(tab.rawLabel, context) ??
                        const SizedBox.shrink(),
                child: Stac.fromJson(tab.child ?? tab.content, context) ??
                    const SizedBox.shrink(),
              ))
          .toList(),
    );
  }
}
