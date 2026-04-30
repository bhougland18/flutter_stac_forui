import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_accordion.dart';

class StacForuiAccordionParser extends StacParser<StacForuiAccordion> {
  const StacForuiAccordionParser();

  @override
  String get type => 'forui_accordion';

  @override
  StacForuiAccordion getModel(Map<String, dynamic> json) =>
      StacForuiAccordion.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiAccordion model) {
    return FAccordion(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      control: FAccordionControl.managed(max: model.maxExpanded),
      children: model.children
          .map((child) => Stac.fromJson(child, context))
          .whereType<Widget>()
          .toList(),
    );
  }
}

class StacForuiAccordionItemParser extends StacParser<StacForuiAccordionItem> {
  const StacForuiAccordionItemParser();

  @override
  String get type => 'forui_accordion_item';

  @override
  StacForuiAccordionItem getModel(Map<String, dynamic> json) =>
      StacForuiAccordionItem.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiAccordionItem model) {
    return FAccordionItem(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      title: Stac.fromJson(model.title, context) ?? const SizedBox.shrink(),
      child: Stac.fromJson(model.child, context) ?? const SizedBox.shrink(),
      icon: Stac.fromJson(model.icon, context) ?? const Icon(FIcons.chevronDown),
      initiallyExpanded: model.initiallyExpanded,
    );
  }
}
