import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiCard parses correctly and has a Key', (WidgetTester tester) async {
    final Map<String, dynamic> cardJson = {
      'type': 'forui_card',
      'key': 'my_card_id',
      'title': 'Card Title',
      'subtitle': 'Card Subtitle',
      'child': {
        'type': 'text',
        'data': 'Card Content',
      },
    };

    await tester.pumpWidget(TestStacApp(json: cardJson));

    // Verify FCard exists
    expect(find.byType(FCard), findsOneWidget);

    // Verify key is attached to FCard
    final card = tester.widget<FCard>(find.byType(FCard));
    expect(card.key, const ValueKey('my_card_id'));

    // Verify title text exists
    expect(find.text('Card Title'), findsOneWidget);
    
    // Verify subtitle text exists
    expect(find.text('Card Subtitle'), findsOneWidget);

    // Verify content text exists
    expect(find.text('Card Content'), findsOneWidget);
  });

  testWidgets('StacForuiCard with rawTitle and rawSubtitle parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> cardJson = {
      'type': 'forui_card',
      'rawTitle': {
        'type': 'text',
        'data': 'Raw Title',
      },
      'rawSubtitle': {
        'type': 'text',
        'data': 'Raw Subtitle',
      },
      'child': {
        'type': 'text',
        'data': 'Card Content',
      },
    };

    await tester.pumpWidget(TestStacApp(json: cardJson));

    // Verify title text exists
    expect(find.text('Raw Title'), findsOneWidget);
    
    // Verify subtitle text exists
    expect(find.text('Raw Subtitle'), findsOneWidget);
  });
}
