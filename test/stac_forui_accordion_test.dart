import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiAccordion parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> accordionJson = {
      'type': 'forui_accordion',
      'key': 'my_accordion_id',
      'children': [
        {
          'type': 'forui_accordion_item',
          'title': {'type': 'text', 'data': 'Accordion Title'},
          'child': {'type': 'text', 'data': 'Accordion Content'},
        },
      ],
    };

    await tester.pumpWidget(TestStacApp(json: accordionJson));

    // Verify FAccordion exists
    expect(find.byType(FAccordion), findsOneWidget);

    // Verify title text exists
    expect(find.text('Accordion Title'), findsOneWidget);

    // Tap to expand
    await tester.tap(find.text('Accordion Title'));
    await tester.pumpAndSettle();

    // Verify content text exists
    expect(find.text('Accordion Content'), findsOneWidget);
  });
}
