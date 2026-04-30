import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_checkbox_parser.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiCheckbox parses correctly and has a Key', (WidgetTester tester) async {
    final Map<String, dynamic> checkboxJson = {
      'type': 'forui_checkbox',
      'key': 'my_checkbox_id',
      'label': 'Checkbox Label',
      'description': 'Checkbox Description',
      'value': true,
    };

    await tester.pumpWidget(TestStacApp(json: checkboxJson));

    // Verify FCheckbox exists
    expect(find.byType(FCheckbox), findsOneWidget);

    // Verify key is attached directly to FCheckbox
    final checkbox = tester.widget<FCheckbox>(find.byType(FCheckbox));
    expect(checkbox.key, const ValueKey('my_checkbox_id'));

    // Verify label text exists
    expect(find.text('Checkbox Label'), findsOneWidget);
    
    // Verify description text exists
    expect(find.text('Checkbox Description'), findsOneWidget);
  });

  testWidgets('StacForuiCheckbox triggers action on change', (WidgetTester tester) async {
    bool actionTriggered = false;

    // Register parsers including mock action
    Stac.initialize(
      parsers: [const StacForuiCheckboxParser()],
      actionParsers: [MockActionParser(() => actionTriggered = true)],
    );

    final Map<String, dynamic> checkboxJson = {
      'type': 'forui_checkbox',
      'label': 'Checkbox Label',
      'value': false,
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
              return Stac.fromJson(checkboxJson, context) ?? const SizedBox.shrink();
            }),
          ),
        ),
      ),
    );

    // Tap the checkbox
    await tester.tap(find.byType(FCheckbox));
    await tester.pumpAndSettle();

    expect(actionTriggered, isTrue);
  });
}
