import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiTextField parses correctly and has a Key', (WidgetTester tester) async {
    final Map<String, dynamic> textFieldJson = {
      'type': 'forui_text_field',
      'key': 'my_text_field_id',
      'label': 'Username',
      'description': 'Enter your username',
      'hint': 'johndoe',
    };

    await tester.pumpWidget(TestStacApp(json: textFieldJson));

    // Verify FTextField exists
    expect(find.byType(FTextField), findsOneWidget);

    // Verify label and hint text exist
    expect(find.text('Username'), findsOneWidget);
    expect(find.text('johndoe'), findsOneWidget);
    expect(find.text('Enter your username'), findsOneWidget);

    // Verify key is attached directly to FTextField
    final textField = tester.widget<FTextField>(find.byType(FTextField));
    expect(textField.key, const ValueKey('my_text_field_id'));
  });
}
