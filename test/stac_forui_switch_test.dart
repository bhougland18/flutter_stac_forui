import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_switch_parser.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiSwitch parses correctly and has a Key', (WidgetTester tester) async {
    final Map<String, dynamic> switchJson = {
      'type': 'forui_switch',
      'key': 'my_switch_id',
      'label': 'Switch Label',
      'description': 'Switch Description',
      'value': true,
    };

    await tester.pumpWidget(TestStacApp(json: switchJson));

    // Verify FSwitch exists
    expect(find.byType(FSwitch), findsOneWidget);

    // Verify key is attached directly to FSwitch
    final switchWidget = tester.widget<FSwitch>(find.byType(FSwitch));
    expect(switchWidget.key, const ValueKey('my_switch_id'));

    // Verify label text exists
    expect(find.text('Switch Label'), findsOneWidget);
    
    // Verify description text exists
    expect(find.text('Switch Description'), findsOneWidget);
  });

  testWidgets('StacForuiSwitch triggers action on change', (WidgetTester tester) async {
    bool actionTriggered = false;
    
    // Register parsers including mock action
    Stac.initialize(
      parsers: [const StacForuiSwitchParser()],
      actionParsers: [MockActionParser(() => actionTriggered = true)],
    );

    final Map<String, dynamic> switchJson = {
      'type': 'forui_switch',
      'label': 'Switch Label',
      'value': false,
      'onChange': {'actionType': 'mock_action'},
    };

    // Use standard MaterialApp for this test to avoid re-registration in TestStacApp
    await tester.pumpWidget(
      FTheme(
        data: FThemeData(
          colors: FColors.neutralLight,
          typography: FTypography.inherit(colors: FColors.neutralLight, touch: true),
          style: FStyle.inherit(colors: FColors.neutralLight, typography: FTypography.inherit(colors: FColors.neutralLight, touch: true), touch: true),
          touch: true,
        ),
        child: MaterialApp(
          home: Builder(builder: (context) {
            return Stac.fromJson(switchJson, context) ?? const SizedBox.shrink();
          }),
        ),
      ),
    );

    // Tap the switch
    await tester.tap(find.byType(FSwitch));
    await tester.pumpAndSettle();

    expect(actionTriggered, isTrue);
  });
}

class MockActionParser extends StacActionParser<MockActionModel> {
  final VoidCallback onCallAction;

  MockActionParser(this.onCallAction);

  @override
  String get actionType => 'mock_action';

  @override
  MockActionModel getModel(Map<String, dynamic> json) => MockActionModel();

  @override
  void onCall(BuildContext context, MockActionModel model) => onCallAction();
}

class MockActionModel {}

