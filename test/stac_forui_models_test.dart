import 'package:flutter_test/flutter_test.dart';
import 'package:stac_forui_components/stac_forui_components.dart';

void main() {
  test('StacForuiScaffold model parses correctly', () {
    final Map<String, dynamic> scaffoldJson = {
      'key': 'my_scaffold_id',
      'content': {
        'type': 'container',
        'child': {
          'type': 'text',
          'data': 'Hello, STAC!',
        },
      },
    };

    final scaffold = StacForuiScaffold.fromJson(scaffoldJson);
    expect(scaffold.key, 'my_scaffold_id');
    expect(scaffold.content?['type'], 'container');
  });

  test('StacForuiSeparator model parses correctly', () {
    final Map<String, dynamic> separatorJson = {
      'key': 'my_sep',
      'vertical': true,
      'color': '#ff0000',
    };

    final separator = StacForuiSeparator.fromJson(separatorJson);
    expect(separator.key, 'my_sep');
    expect(separator.vertical, true);
    expect(separator.color, '#ff0000');
  });

  test('StacForuiTextField model parses correctly', () {
    final Map<String, dynamic> textFieldJson = {
      'key': 'my_text_field',
      'label': 'Username',
      'description': 'Enter your username',
      'hint': 'johndoe',
      'obscureText': true,
      'onChange': {'type': 'log', 'message': 'Changed'},
      'onSubmit': {'type': 'log', 'message': 'Submitted'},
    };

    final textField = StacForuiTextField.fromJson(textFieldJson);
    expect(textField.key, 'my_text_field');
    expect(textField.label, 'Username');
    expect(textField.description, 'Enter your username');
    expect(textField.hint, 'johndoe');
    expect(textField.obscureText, true);
    expect(textField.onChange?['type'], 'log');
    expect(textField.onSubmit?['type'], 'log');
  });
}
