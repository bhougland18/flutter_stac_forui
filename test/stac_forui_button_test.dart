import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_button_parser.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiButton parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> buttonJson = {
      'type': 'forui_button',
      'key': 'my_button_id',
      'label': 'Click Me',
      'style': 'primary',
    };

    await tester.pumpWidget(TestStacApp(json: buttonJson));

    // Verify FButton exists
    expect(find.byType(FButton), findsOneWidget);

    // Verify key
    final button = tester.widget<FButton>(find.byType(FButton));
    expect(button.key, const ValueKey('my_button_id'));

    // Verify label text exists
    expect(find.text('Click Me'), findsOneWidget);
  });

  testWidgets('StacForuiButton triggers onPress action', (WidgetTester tester) async {
    bool actionTriggered = false;

    // Register parsers including mock action
    Stac.initialize(
      parsers: [const StacForuiButtonParser()],
      actionParsers: [MockActionParser(() => actionTriggered = true)],
    );

    final Map<String, dynamic> buttonJson = {
      'type': 'forui_button',
      'label': 'Action Button',
      'onPress': {'actionType': 'mock_action'},
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
              return Stac.fromJson(buttonJson, context) ?? const SizedBox.shrink();
            }),
          ),
        ),
      ),
    );

    // Tap the button
    await tester.tap(find.text('Action Button'));
    await tester.pumpAndSettle();

    expect(actionTriggered, isTrue);
  });

  testWidgets('StacForuiButton supports style overrides', (WidgetTester tester) async {
    final Map<String, dynamic> buttonJson = {
      'type': 'forui_button',
      'label': 'Custom Padding Button',
      'styleOverride': {
        'contentPadding': {'left': 32.0, 'right': 32.0, 'top': 16.0, 'bottom': 16.0},
      },
    };

    // Register parsers
    Stac.initialize(parsers: [
      const StacForuiButtonParser(),
    ]);

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
              return Stac.fromJson(buttonJson, context) ?? const SizedBox.shrink();
            }),
          ),
        ),
      ),
    );

    final button = tester.widget<FButton>(find.byType(FButton));
    
    // Check if the style override made it into the widget
    // In forui 0.21.2, FButton.style is the FButtonStyleDelta we passed
    final styleDelta = button.style as dynamic;
    final padding = styleDelta.contentStyle.padding(EdgeInsets.zero) as EdgeInsets;
    expect(padding.left, 32.0);
    expect(padding.top, 16.0);
  });
}
