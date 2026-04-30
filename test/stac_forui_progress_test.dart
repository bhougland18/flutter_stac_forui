import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiProgress (indeterminate) parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> progressJson = {
      'type': 'forui_progress',
      'key': 'my_progress_id',
    };

    await tester.pumpWidget(TestStacApp(json: progressJson));

    // Verify FProgress exists
    expect(find.byType(FProgress), findsOneWidget);

    // Verify key is attached to FProgress
    final progress = tester.widget<FProgress>(find.byType(FProgress));
    expect(progress.key, const ValueKey('my_progress_id'));
  });

  testWidgets('StacForuiProgress (determinate) parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> progressJson = {
      'type': 'forui_progress',
      'key': 'my_determinate_progress_id',
      'value': 0.5,
    };

    await tester.pumpWidget(TestStacApp(json: progressJson));

    // Verify FDeterminateProgress exists
    expect(find.byType(FDeterminateProgress), findsOneWidget);

    // Verify key is attached to FDeterminateProgress
    final progress = tester.widget<FDeterminateProgress>(find.byType(FDeterminateProgress));
    expect(progress.key, const ValueKey('my_determinate_progress_id'));
    expect(progress.value, 0.5);
  });
}
