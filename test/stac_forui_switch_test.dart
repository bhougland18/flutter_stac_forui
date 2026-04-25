import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiSwitch parses correctly and has a Key', (WidgetTester tester) async {
    final Map<String, dynamic> switchJson = {
      'type': 'forui_switch',
      'key': 'my_switch_id',
      'label': 'Enable Notifications',
      'description': 'Stay updated with latest news',
      'value': true,
      'semanticLabel': 'Notification Switch',
    };

    await tester.pumpWidget(TestStacApp(json: switchJson));

    // Verify FSwitch exists
    expect(find.byType(FSwitch), findsOneWidget);

    // Verify label and description text exist
    expect(find.text('Enable Notifications'), findsOneWidget);
    expect(find.text('Stay updated with latest news'), findsOneWidget);

    // Verify value
    final fSwitch = tester.widget<FSwitch>(find.byType(FSwitch));
    expect(fSwitch.value, isTrue);

    // Verify semantic label via Semantics widget
    final semanticsFinder = find.byWidgetPredicate(
      (widget) => widget is Semantics && widget.properties.label == 'Notification Switch',
    );
    expect(semanticsFinder, findsOneWidget);

    // Verify key is attached directly
    expect(fSwitch.key, const ValueKey('my_switch_id'));
  });
}
