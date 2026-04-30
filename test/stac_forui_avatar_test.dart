import 'package:flutter/widgets.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiAvatar parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> avatarJson = {
      'type': 'forui_avatar',
      'key': 'my_avatar_id',
      'image': 'https://example.com/avatar.png',
      'fallback': {
        'type': 'text',
        'data': 'JD',
      },
    };

    await tester.pumpWidget(TestStacApp(json: avatarJson));

    // Verify FAvatar exists
    expect(find.byType(FAvatar), findsOneWidget);

    // Verify key is attached to FAvatar
    final avatar = tester.widget<FAvatar>(find.byType(FAvatar));
    expect(avatar.key, const ValueKey('my_avatar_id'));
  });

  testWidgets('StacForuiAvatar.raw parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> avatarJson = {
      'type': 'forui_avatar',
      'child': {
        'type': 'text',
        'data': 'JD',
      },
    };

    await tester.pumpWidget(TestStacApp(json: avatarJson));

    // Verify FAvatar exists
    expect(find.byType(FAvatar), findsOneWidget);

    // Verify child text exists
    expect(find.text('JD'), findsOneWidget);
  });
}
