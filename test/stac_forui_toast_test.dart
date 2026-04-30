import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiShowToastAction works correctly', (WidgetTester tester) async {
    final Map<String, dynamic> toasterJson = {
      'type': 'forui_toaster',
      'child': {
        'type': 'forui_button',
        'label': 'Show Toast',
        'onPress': {
          'actionType': 'forui_show_toast',
          'title': 'Toast Message',
        },
      },
    };

    await tester.pumpWidget(TestStacApp(json: toasterJson));

    // Verify FToaster and Button exist
    expect(find.byType(FToaster), findsOneWidget);
    expect(find.text('Show Toast'), findsOneWidget);

    // Tap button to show toast
    await tester.tap(find.text('Show Toast'));
    await tester.pumpAndSettle();

    // Verify toast exists
    expect(find.text('Toast Message'), findsOneWidget);
  });
}
