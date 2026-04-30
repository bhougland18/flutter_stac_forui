import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiBadge parses correctly and has a Key', (WidgetTester tester) async {
    final Map<String, dynamic> badgeJson = {
      'type': 'forui_badge',
      'key': 'my_badge_id',
      'label': 'Badge Label',
    };

    await tester.pumpWidget(TestStacApp(json: badgeJson));

    // Verify FBadge exists
    expect(find.byType(FBadge), findsOneWidget);

    // Verify key is attached to FBadge
    final badge = tester.widget<FBadge>(find.byType(FBadge));
    expect(badge.key, const ValueKey('my_badge_id'));

    // Verify label text exists
    expect(find.text('Badge Label'), findsOneWidget);
  });

  testWidgets('StacForuiBadge with rawLabel parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> badgeJson = {
      'type': 'forui_badge',
      'rawLabel': {
        'type': 'text',
        'data': 'Raw Label',
      },
    };

    await tester.pumpWidget(TestStacApp(json: badgeJson));

    // Verify label text exists
    expect(find.text('Raw Label'), findsOneWidget);
  });
}
