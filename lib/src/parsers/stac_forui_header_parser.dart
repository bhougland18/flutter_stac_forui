import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_header.dart';

class StacForuiHeaderParser extends StacParser<StacForuiHeader> {
  const StacForuiHeaderParser();

  @override
  String get type => 'forui_header';

  @override
  StacForuiHeader getModel(Map<String, dynamic> json) =>
      StacForuiHeader.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiHeader model) {
    return FHeader(
      key: model.key != null ? ValueKey(model.key) : null,
      title: model.title,
      rawTitle: Stac.fromJson(model.rawTitle, context),
      actions: model.actions
              ?.map((e) => Stac.fromJson(e, context))
              .whereType<Widget>()
              .toList() ??
          const [],
    );
  }
}
