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
    final title = model.title != null
        ? Text(model.title!)
        : Stac.fromJson(model.rawTitle, context);

    return FHeader(
      key: model.key != null ? ValueKey(model.key) : null,
      title: title ?? const SizedBox.shrink(),
      suffixes: (model.suffixes ?? model.actions)
              ?.map((e) => Stac.fromJson(e, context))
              .whereType<Widget>()
              .toList() ??
          const [],
    );
  }
}
