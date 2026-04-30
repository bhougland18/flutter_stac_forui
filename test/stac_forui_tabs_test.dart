import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_tabs_parser.dart';
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

  testWidgets('StacForuiTabs triggers onChange action', (WidgetTester tester) async {
    bool actionTriggered = false;

    // Register parsers including mock action
    Stac.initialize(
      parsers: [const StacForuiTabsParser()],
      actionParsers: [MockActionParser(() => actionTriggered = true)],
    );

    final Map<String, dynamic> tabsJson = {
      'type': 'forui_tabs',
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
      'onChange': {'actionType': 'mock_action'},
    };

    await tester.pumpWidget(
      FTheme(
        data: FThemeData(
          colors: FColors.neutralLight,
          typography: FTypography.inherit(colors: FColors.neutralLight, touch: true),
          style: FStyle.inherit(
            colors: FColors.neutralLight,
            typography: FTypography.inherit(colors: FColors.neutralLight, touch: true),
            touch: true,
          ),
          touch: true,
        ),
        child: MaterialApp(
          home: Scaffold(
            body: Builder(builder: (context) {
              return Stac.fromJson(tabsJson, context) ?? const SizedBox.shrink();
            }),
          ),
        ),
      ),
    );

    // Tap Tab 2
    await tester.tap(find.text('Tab 2'));
    await tester.pumpAndSettle();

    expect(actionTriggered, isTrue);
  });
}
