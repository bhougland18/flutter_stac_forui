import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
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
}
