import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiResizable parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> resizableJson = {
      'type': 'forui_resizable',
      'key': 'my_resizable_id',
      'children': [
        {
          'initialExtent': 100.0,
          'child': {'type': 'text', 'data': 'Region 1'},
        },
        {
          'initialExtent': 200.0,
          'child': {'type': 'text', 'data': 'Region 2'},
        },
      ],
    };

    await tester.pumpWidget(TestStacApp(json: resizableJson));

    // Verify FResizable exists
    expect(find.byType(FResizable), findsOneWidget);

    // Verify key is attached to FResizable
    final resizable = tester.widget<FResizable>(find.byType(FResizable));
    expect(resizable.key, const ValueKey('my_resizable_id'));

    // Verify children text exist
    expect(find.text('Region 1'), findsOneWidget);
    expect(find.text('Region 2'), findsOneWidget);
  });
}
