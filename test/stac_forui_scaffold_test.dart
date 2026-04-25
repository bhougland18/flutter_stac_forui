import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiScaffold parses correctly and has a Key', (WidgetTester tester) async {
    final Map<String, dynamic> scaffoldJson = {
      'type': 'forui_scaffold',
      'key': 'my_scaffold_id',
      'content': {
        'type': 'container',
        'child': {
          'type': 'text',
          'data': 'Hello, STAC!',
        },
      },
    };

    await tester.pumpWidget(TestStacApp(json: scaffoldJson));

    // Verify FScaffold exists
    expect(find.byType(FScaffold), findsOneWidget);

    // Verify key is attached to FScaffold
    final scaffold = tester.widget<FScaffold>(find.byType(FScaffold));
    expect(scaffold.key, const ValueKey('my_scaffold_id'));

    // Verify content text exists
    expect(find.text('Hello, STAC!'), findsOneWidget);
  });
}
