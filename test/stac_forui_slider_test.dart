import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
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
}
