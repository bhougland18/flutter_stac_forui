import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_select_group_parser.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiSelectGroup parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> selectGroupJson = {
      'type': 'forui_select_group',
      'key': 'my_select_group_id',
      'label': 'Select Group Label',
      'description': 'Select Group Description',
      'items': [
        {'value': 'radio1', 'label': 'Radio 1', 'type': 'radio'},
        {'value': 'radio2', 'label': 'Radio 2', 'type': 'radio'},
      ],
    };

    await tester.pumpWidget(TestStacApp(json: selectGroupJson));

    // Verify FSelectGroup exists
    expect(find.byType(FSelectGroup<String>), findsOneWidget);

    // Verify labels exist
    expect(find.text('Select Group Label'), findsOneWidget);
    expect(find.text('Radio 1'), findsOneWidget);
    expect(find.text('Radio 2'), findsOneWidget);
  });

  testWidgets('StacForuiSelectGroup triggers onChanged action', (WidgetTester tester) async {
    bool actionTriggered = false;

    // Register parsers including mock action
    Stac.initialize(
      parsers: [const StacForuiSelectGroupParser()],
      actionParsers: [MockActionParser(() => actionTriggered = true)],
    );

    final Map<String, dynamic> selectGroupJson = {
      'type': 'forui_select_group',
      'items': [
        {'value': 'item1', 'label': 'Item 1', 'type': 'checkbox'},
      ],
      'onChanged': {'actionType': 'mock_action'},
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
              return Stac.fromJson(selectGroupJson, context) ?? const SizedBox.shrink();
            }),
          ),
        ),
      ),
    );

    // Tap the item
    await tester.tap(find.text('Item 1'));
    await tester.pumpAndSettle();

    expect(actionTriggered, isTrue);
  });
}
