import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiTabs parses correctly and switches tabs', (WidgetTester tester) async {
    final Map<String, dynamic> tabsJson = {
      'type': 'forui_tabs',
      'key': 'my_tabs_id',
      'tabs': [
        {
          'label': 'Tab 1',
          'content': {'type': 'text', 'data': 'Content 1'},
        },
        {
          'label': 'Tab 2',
          'content': {'type': 'text', 'data': 'Content 2'},
        },
      ],
    };

    await tester.pumpWidget(TestStacApp(json: tabsJson));

    // Verify FTabs exists
    expect(find.byType(FTabs), findsOneWidget);

    // Verify Tab 1 content is visible
    expect(find.text('Content 1'), findsOneWidget);
    expect(find.text('Content 2'), findsNothing);

    // Tap Tab 2
    await tester.tap(find.text('Tab 2'));
    await tester.pumpAndSettle();

    // Verify Tab 2 content is visible
    expect(find.text('Content 2'), findsOneWidget);
    expect(find.text('Content 1'), findsNothing);
  });
}
