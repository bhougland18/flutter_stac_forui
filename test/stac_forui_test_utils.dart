import 'package:flutter/material.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/stac_forui_components.dart';

class TestStacApp extends StatelessWidget {
  const TestStacApp({super.key, required this.json});

  final Map<String, dynamic> json;

  @override
  Widget build(BuildContext context) {
    StacForui.register();

    final colors = FColors.neutralLight;
    final typography = FTypography.inherit(colors: colors, touch: true);
    final style = FStyle.inherit(colors: colors, typography: typography, touch: true);

    return MaterialApp(
      home: FTheme(
        data: FThemeData(
          colors: colors,
          typography: typography,
          style: style,
          touch: true,
        ),
        child: Builder(builder: (context) {
          return Stac.fromJson(json, context) ?? const SizedBox.shrink();
        }),
      ),
    );
  }
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

