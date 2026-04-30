import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiDialog parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> dialogJson = {
      'type': 'forui_dialog',
      'key': 'my_dialog_id',
      'title': 'Dialog Title',
      'body': 'Dialog Body',
      'actions': [
        {
          'type': 'forui_button',
          'label': 'Action 1',
        },
      ],
    };

    await tester.pumpWidget(TestStacApp(json: dialogJson));

    // Verify FDialog exists
    expect(find.byType(FDialog), findsOneWidget);

    // Verify title text exists
    expect(find.text('Dialog Title'), findsOneWidget);

    // Verify body text exists
    expect(find.text('Dialog Body'), findsOneWidget);

    // Verify action exists
    expect(find.text('Action 1'), findsOneWidget);
  });
}
