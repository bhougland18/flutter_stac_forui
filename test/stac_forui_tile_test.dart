import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_tile_group_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_tile_parser.dart';
import 'stac_forui_test_utils.dart';

void main() {
  testWidgets('StacForuiTile parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> tileJson = {
      'type': 'forui_tile_group',
      'children': [
        {
          'type': 'forui_tile',
          'key': 'my_tile_id',
          'title': {'type': 'text', 'data': 'Tile Title'},
          'subtitle': {'type': 'text', 'data': 'Tile Subtitle'},
          'details': {'type': 'text', 'data': 'Tile Details'},
        }
      ]
    };

    await tester.pumpWidget(TestStacApp(json: tileJson));

    // Verify FTile exists
    expect(find.byType(FTile), findsOneWidget);

    // Verify key is attached directly to FTile
    final tileWidget = tester.widget<FTile>(find.byType(FTile));
    expect(tileWidget.key, const ValueKey('my_tile_id'));

    // Verify title text exists
    expect(find.text('Tile Title'), findsOneWidget);
    
    // Verify subtitle text exists
    expect(find.text('Tile Subtitle'), findsOneWidget);

    // Verify details text exists
    expect(find.text('Tile Details'), findsOneWidget);
  });

  testWidgets('StacForuiTileGroup parses correctly', (WidgetTester tester) async {
    final Map<String, dynamic> tileGroupJson = {
      'type': 'forui_tile_group',
      'key': 'my_tile_group_id',
      'label': {'type': 'text', 'data': 'Group Label'},
      'description': {'type': 'text', 'data': 'Group Description'},
      'children': [
        {
          'type': 'forui_tile',
          'title': {'type': 'text', 'data': 'Tile 1'},
        },
        {
          'type': 'forui_tile',
          'title': {'type': 'text', 'data': 'Tile 2'},
        },
      ],
    };

    await tester.pumpWidget(TestStacApp(json: tileGroupJson));

    // Verify FTileGroup exists
    expect(find.byType(FTileGroup), findsOneWidget);

    // Verify key is attached directly to FTileGroup
    final tileGroupWidget = tester.widget<FTileGroup>(find.byType(FTileGroup));
    expect(tileGroupWidget.key, const ValueKey('my_tile_group_id'));

    // Verify label text exists
    expect(find.text('Group Label'), findsOneWidget);
    
    // Verify description text exists
    expect(find.text('Group Description'), findsOneWidget);

    // Verify FTile children exist
    expect(find.byType(FTile), findsNWidgets(2));
    expect(find.text('Tile 1'), findsOneWidget);
    expect(find.text('Tile 2'), findsOneWidget);
  });

  testWidgets('StacForuiTile triggers onPress action', (WidgetTester tester) async {
    bool actionTriggered = false;
    
    // Register parsers including mock action
    Stac.initialize(
      parsers: [const StacForuiTileGroupParser(), const StacForuiTileParser()],
      actionParsers: [MockActionParser(() => actionTriggered = true)],
    );

    final Map<String, dynamic> tileJson = {
      'type': 'forui_tile_group',
      'children': [
        {
          'type': 'forui_tile',
          'title': {'type': 'text', 'data': 'Clickable Tile'},
          'onPress': {'actionType': 'mock_action'},
        }
      ]
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
            return Stac.fromJson(tileJson, context) ?? const SizedBox.shrink();
          }),
        ),
      ),
    );

    // Tap the tile
    await tester.tap(find.text('Clickable Tile'));
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

