import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_progress.dart';

class StacForuiProgressParser extends StacParser<StacForuiProgress> {
  const StacForuiProgressParser();

  @override
  String get type => 'forui_progress';

  @override
  StacForuiProgress getModel(Map<String, dynamic> json) =>
      StacForuiProgress.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiProgress model) {
    if (model.value != null) {
      return FDeterminateProgress(
        key: model.key != null ? ValueKey<String>(model.key!) : null,
        value: model.value!,
        semanticsLabel: model.semanticsLabel,
      );
    } else {
      return FProgress(
        key: model.key != null ? ValueKey<String>(model.key!) : null,
        semanticsLabel: model.semanticsLabel,
      );
    }
  }
}
