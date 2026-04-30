import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_slider_parser.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiSlider parses correctly and has a Key', (WidgetTester tester) async {
    final Map<String, dynamic> sliderJson = {
      'type': 'forui_slider',
      'key': 'my_slider_id',
      'label': 'Slider Label',
      'description': 'Slider Description',
      'initialMax': 0.7,
    };

    await tester.pumpWidget(TestStacApp(json: sliderJson));

    // Verify FSlider exists
    expect(find.byType(FSlider), findsOneWidget);

    // Verify key is attached directly to FSlider
    final slider = tester.widget<FSlider>(find.byType(FSlider));
    expect(slider.key, const ValueKey('my_slider_id'));

    // Verify label text exists
    expect(find.text('Slider Label'), findsOneWidget);
    
    // Verify description text exists
    expect(find.text('Slider Description'), findsOneWidget);
  });

  testWidgets('StacForuiSlider triggers onEnd action', (WidgetTester tester) async {
    bool actionTriggered = false;

    // Register parsers including mock action
    Stac.initialize(
      parsers: [const StacForuiSliderParser()],
      actionParsers: [MockActionParser(() => actionTriggered = true)],
    );

    final Map<String, dynamic> sliderJson = {
      'type': 'forui_slider',
      'label': 'Slider Label',
      'initialMax': 0.5,
      'onEnd': {'actionType': 'mock_action'},
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
              return Stac.fromJson(sliderJson, context) ?? const SizedBox.shrink();
            }),
          ),
        ),
      ),
    );

    // Verify FSlider exists
    expect(find.byType(FSlider), findsOneWidget);

    // Simulate drag to trigger onEnd
    await tester.drag(find.byType(FSlider), const Offset(100, 0));
    await tester.pumpAndSettle();

    expect(actionTriggered, isTrue);
  });
}
