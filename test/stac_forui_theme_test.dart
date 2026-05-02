import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_theme_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_button_parser.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiTheme overrides typography and affects children', (WidgetTester tester) async {
    final Map<String, dynamic> themeJson = {
      'type': 'forui_theme',
      'typography': {
        'sm': {
          'fontSize': 40.0,
        },
      },
      'child': {
        'type': 'forui_button',
        'label': 'Themed Button',
      },
    };

    // Register parsers
    Stac.initialize(parsers: [
      const StacForuiThemeParser(),
      const StacForuiButtonParser(),
    ]);

    late FThemeData capturedTheme;
    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return Stac.fromJson(themeJson, context) ?? const SizedBox.shrink();
          }),
        ),
      ),
    );

    // Verify FTheme is in the tree with our override
    final fThemeWidget = tester.widget<FTheme>(find.byType(FTheme).last);
    expect(fThemeWidget.data.typography.sm.fontSize, 40.0);

    // Also verify it propagates to the button's text indirectly
    // Since FButton might use AnimatedDefaultTextStyle, we check the theme data it sees
    final buttonContext = tester.element(find.byType(FButton));
    capturedTheme = FTheme.of(buttonContext);
    expect(capturedTheme.typography.sm.fontSize, 40.0);
  });

  testWidgets('StacForuiTheme overrides style and affects children', (WidgetTester tester) async {
    final Map<String, dynamic> themeJson = {
      'type': 'forui_theme',
      'style': {
        'borderRadius': 20.0,
        'borderWidth': 5.0,
      },
      'child': {
        'type': 'forui_button',
        'label': 'Styled Button',
      },
    };

    // Register parsers
    Stac.initialize(parsers: [
      const StacForuiThemeParser(),
      const StacForuiButtonParser(),
    ]);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: Builder(builder: (context) {
            return Stac.fromJson(themeJson, context) ?? const SizedBox.shrink();
          }),
        ),
      ),
    );

    // Verify FTheme is in the tree with our style overrides
    final buttonContext = tester.element(find.byType(FButton));
    final theme = FTheme.of(buttonContext);
    
    // Check borderRadius md token
    // We just want to see if our 20.0 made it in.
    expect(theme.style.borderRadius.md.bottomLeft.x, 20.0);
    expect(theme.style.borderWidth, 5.0);
  });
}
