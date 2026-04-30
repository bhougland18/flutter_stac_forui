import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_slider.dart';

class StacForuiSliderParser extends StacParser<StacForuiSlider> {
  const StacForuiSliderParser();

  @override
  String get type => 'forui_slider';

  @override
  StacForuiSlider getModel(Map<String, dynamic> json) =>
      StacForuiSlider.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiSlider model) {
    final FSliderControl control;
    if (model.initialMin != null) {
      control = FSliderControl.managedContinuousRange(
        initial: FSliderValue(min: model.initialMin!, max: model.initialMax),
      );
    } else {
      control = FSliderControl.managedContinuous(
        initial: FSliderValue(max: model.initialMax),
      );
    }

    return FSlider(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      control: control,
      label: model.label != null ? Text(model.label!) : null,
      description: model.description != null ? Text(model.description!) : null,
      marks: model.marks
              ?.map((mark) => FSliderMark(
                    value: mark.value,
                    tick: mark.tick,
                    label: mark.label != null ? Text(mark.label!) : null,
                  ))
              .toList() ??
          const [],
      enabled: model.enabled,
      layout: model.vertical ? FLayout.btt : FLayout.ltr,
      onEnd: model.onEnd != null
          ? (value) => Stac.onCallFromJson(model.onEnd, context)
          : null,
    );
  }
}
