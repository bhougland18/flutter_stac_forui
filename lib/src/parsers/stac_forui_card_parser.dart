import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_card.dart';

class StacForuiCardParser extends StacParser<StacForuiCard> {
  const StacForuiCardParser();

  @override
  String get type => 'forui_card';

  @override
  StacForuiCard getModel(Map<String, dynamic> json) =>
      StacForuiCard.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiCard model) {
    return FCard(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      title: model.title != null
          ? Text(model.title!)
          : Stac.fromJson(model.rawTitle, context),
      subtitle: model.subtitle != null
          ? Text(model.subtitle!)
          : Stac.fromJson(model.rawSubtitle, context),
      child: Stac.fromJson(model.child, context),
    );
  }
}
