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
        'type': 'text',
        'data': 'Hello, STAC!',
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

  testWidgets('StacForuiScaffold supports style overrides', (WidgetTester tester) async {
    final Map<String, dynamic> scaffoldJson = {
      'type': 'forui_scaffold',
      'style': {
        'backgroundColor': '#FF0000',
        'childPadding': {'left': 40.0, 'top': 20.0},
      },
      'content': {'type': 'text', 'data': 'Styled Scaffold'},
    };

    await tester.pumpWidget(TestStacApp(json: scaffoldJson));

    final scaffold = tester.widget<FScaffold>(find.byType(FScaffold).last);
    final styleDelta = scaffold.scaffoldStyle as dynamic;
    
    expect(styleDelta.backgroundColor, const Color(0xFFFF0000));
    
    // Test the childPadding delta
    final padding = styleDelta.childPadding(EdgeInsets.zero) as EdgeInsets;
    expect(padding.left, 40.0);
    expect(padding.top, 20.0);
  });
}

