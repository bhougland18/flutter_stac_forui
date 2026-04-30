import 'package:json_annotation/json_annotation.dart';
import 'package:stac/stac.dart';

part 'stac_forui_calendar.g.dart';

@JsonSerializable()
class StacForuiCalendar extends StacWidget {
  const StacForuiCalendar({
    this.key,
    this.initialDate,
    this.initialDates,
    this.initialRangeStart,
    this.initialRangeEnd,
    this.start,
    this.end,
    this.today,
    this.onPress,
    this.onLongPress,
    this.onMonthChange,
  });

  final String? key;
  final DateTime? initialDate;
  final List<DateTime>? initialDates;
  final DateTime? initialRangeStart;
  final DateTime? initialRangeEnd;
  final DateTime? start;
  final DateTime? end;
  final DateTime? today;
  final Map<String, dynamic>? onPress;
  final Map<String, dynamic>? onLongPress;
  final Map<String, dynamic>? onMonthChange;

  factory StacForuiCalendar.fromJson(Map<String, dynamic> json) =>
      _$StacForuiCalendarFromJson(json);

  @override
  Map<String, dynamic> toJson() => _$StacForuiCalendarToJson(this);
}
