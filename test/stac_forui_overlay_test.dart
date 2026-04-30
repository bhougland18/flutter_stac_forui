import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiTooltip parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> tooltipJson = {
      'type': 'forui_tooltip',
      'key': 'my_tooltip_id',
      'tip': {'type': 'text', 'data': 'Tip Text'},
      'child': {'type': 'text', 'data': 'Child Text'},
    };

    await tester.pumpWidget(TestStacApp(json: tooltipJson));

    // Verify FTooltip exists
    expect(find.byType(FTooltip), findsOneWidget);

    // Verify key is attached to FTooltip
    final tooltip = tester.widget<FTooltip>(find.byType(FTooltip));
    expect(tooltip.key, const ValueKey('my_tooltip_id'));

    // Verify child text exists
    expect(find.text('Child Text'), findsOneWidget);
  });

  testWidgets('StacForuiPopover parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> popoverJson = {
      'type': 'forui_popover',
      'key': 'my_popover_id',
      'popover': {'type': 'text', 'data': 'Popover Text'},
      'child': {'type': 'text', 'data': 'Trigger Text'},
    };

    await tester.pumpWidget(TestStacApp(json: popoverJson));

    // Verify FPopover exists
    expect(find.byType(FPopover), findsOneWidget);

    // Verify key is attached to FPopover
    final popover = tester.widget<FPopover>(find.byType(FPopover));
    expect(popover.key, const ValueKey('my_popover_id'));

    // Verify child text exists
    expect(find.text('Trigger Text'), findsOneWidget);
  });
}
