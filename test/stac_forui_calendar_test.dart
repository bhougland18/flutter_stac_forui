import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiCalendar parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> calendarJson = {
      'type': 'forui_calendar',
      'key': 'my_calendar_id',
      'initialDate': '2024-01-01T00:00:00.000',
    };

    await tester.pumpWidget(TestStacApp(json: calendarJson));

    // Verify FCalendar exists
    expect(find.byType(FCalendar), findsOneWidget);

    // Verify key is attached to FCalendar
    final calendar = tester.widget<FCalendar>(find.byType(FCalendar));
    expect(calendar.key, const ValueKey('my_calendar_id'));
  });
}
