import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiAlert parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> alertJson = {
      'type': 'forui_alert',
      'key': 'my_alert_id',
      'title': 'Alert Title',
      'subtitle': 'Alert Subtitle',
    };

    await tester.pumpWidget(TestStacApp(json: alertJson));

    // Verify FAlert exists
    expect(find.byType(FAlert), findsOneWidget);

    // Verify key is attached to FAlert
    final alert = tester.widget<FAlert>(find.byType(FAlert));
    expect(alert.key, const ValueKey('my_alert_id'));

    // Verify title text exists
    expect(find.text('Alert Title'), findsOneWidget);
    
    // Verify subtitle text exists
    expect(find.text('Alert Subtitle'), findsOneWidget);
  });
}
