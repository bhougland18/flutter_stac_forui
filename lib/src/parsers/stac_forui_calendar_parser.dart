import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_calendar.dart';

class StacForuiCalendarParser extends StacParser<StacForuiCalendar> {
  const StacForuiCalendarParser();

  @override
  String get type => 'forui_calendar';

  @override
  StacForuiCalendar getModel(Map<String, dynamic> json) =>
      StacForuiCalendar.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiCalendar model) {
    final FCalendarControl control;
    if (model.initialDates != null) {
      control = FCalendarControl.managedDates(initial: model.initialDates!.toSet());
    } else if (model.initialRangeStart != null && model.initialRangeEnd != null) {
      control = FCalendarControl.managedRange(
        initial: (model.initialRangeStart!, model.initialRangeEnd!),
      );
    } else {
      control = FCalendarControl.managedDate(initial: model.initialDate);
    }

    return FCalendar(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      control: control,
      start: model.start,
      end: model.end,
      today: model.today,
      onPress: model.onPress != null
          ? (date) => Stac.onCallFromJson(model.onPress, context)
          : null,
      onLongPress: model.onLongPress != null
          ? (date) => Stac.onCallFromJson(model.onLongPress, context)
          : null,
      onMonthChange: model.onMonthChange != null
          ? (date) => Stac.onCallFromJson(model.onMonthChange, context)
          : null,
    );
  }
}
