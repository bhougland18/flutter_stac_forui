// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_calendar.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiCalendar _$StacForuiCalendarFromJson(
  Map<String, dynamic> json,
) => StacForuiCalendar(
  key: json['key'] as String?,
  initialDate: json['initialDate'] == null
      ? null
      : DateTime.parse(json['initialDate'] as String),
  initialDates: (json['initialDates'] as List<dynamic>?)
      ?.map((e) => DateTime.parse(e as String))
      .toList(),
  initialRangeStart: json['initialRangeStart'] == null
      ? null
      : DateTime.parse(json['initialRangeStart'] as String),
  initialRangeEnd: json['initialRangeEnd'] == null
      ? null
      : DateTime.parse(json['initialRangeEnd'] as String),
  start: json['start'] == null ? null : DateTime.parse(json['start'] as String),
  end: json['end'] == null ? null : DateTime.parse(json['end'] as String),
  today: json['today'] == null ? null : DateTime.parse(json['today'] as String),
  onPress: json['onPress'] as Map<String, dynamic>?,
  onLongPress: json['onLongPress'] as Map<String, dynamic>?,
  onMonthChange: json['onMonthChange'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$StacForuiCalendarToJson(StacForuiCalendar instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'initialDate': instance.initialDate?.toIso8601String(),
      'initialDates': instance.initialDates
          ?.map((e) => e.toIso8601String())
          .toList(),
      'initialRangeStart': instance.initialRangeStart?.toIso8601String(),
      'initialRangeEnd': instance.initialRangeEnd?.toIso8601String(),
      'start': instance.start?.toIso8601String(),
      'end': instance.end?.toIso8601String(),
      'today': instance.today?.toIso8601String(),
      'onPress': instance.onPress,
      'onLongPress': instance.onLongPress,
      'onMonthChange': instance.onMonthChange,
    };
