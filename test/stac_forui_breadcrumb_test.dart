import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiBreadcrumb parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> breadcrumbJson = {
      'type': 'forui_breadcrumb',
      'key': 'my_breadcrumb_id',
      'children': [
        {
          'type': 'forui_breadcrumb_item',
          'child': {'type': 'text', 'data': 'Home'},
        },
        {
          'type': 'forui_breadcrumb_item',
          'child': {'type': 'text', 'data': 'Widgets'},
          'current': true,
        },
      ],
    };

    await tester.pumpWidget(TestStacApp(json: breadcrumbJson));

    // Verify FBreadcrumb exists
    expect(find.byType(FBreadcrumb), findsOneWidget);

    // Verify key is attached to FBreadcrumb
    final breadcrumb = tester.widget<FBreadcrumb>(find.byType(FBreadcrumb));
    expect(breadcrumb.key, const ValueKey('my_breadcrumb_id'));

    // Verify children text exist
    expect(find.text('Home'), findsOneWidget);
    expect(find.text('Widgets'), findsOneWidget);
  });
}
