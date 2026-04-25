import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_switch.dart';

class StacForuiSwitchParser extends StacParser<StacForuiSwitch> {
  const StacForuiSwitchParser();

  @override
  String get type => 'forui_switch';

  @override
  StacForuiSwitch getModel(Map<String, dynamic> json) =>
      StacForuiSwitch.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiSwitch model) {
    final theme = FTheme.of(context);
    final label = model.label != null ? Text(model.label!) : null;
    final description =
        model.description != null ? Text(model.description!) : null;

    final switchWidget = FSwitch(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      value: model.value,
      onChanged: model.enabled && model.onChanged != null
          ? (value) => Stac.onCallFromJson(model.onChanged, context)
          : null,
    );

    Widget result = switchWidget;

    if (model.semanticLabel != null) {
      result = Semantics(
        label: model.semanticLabel,
        child: result,
      );
    }

    if (label == null && description == null) {
      return result;
    }

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        if (label != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 4),
            child: DefaultTextStyle.merge(
              style: theme.typography.sm.copyWith(
                fontWeight: FontWeight.w500,
                color: theme.colorScheme.foreground,
              ),
              child: label,
            ),
          ),
        if (description != null)
          Padding(
            padding: const EdgeInsets.only(bottom: 8),
            child: DefaultTextStyle.merge(
              style: theme.typography.xs.copyWith(
                color: theme.colorScheme.mutedForeground,
              ),
              child: description,
            ),
          ),
        result,
      ],
    );
  }
}
