import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_button_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_header_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_scaffold_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_separator_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_switch_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_text_field_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_theme_parser.dart';

class StacForui {
  static void register() {
    Stac.initialize(parsers: [
      const StacForuiThemeParser(),
      const StacForuiScaffoldParser(),
      const StacForuiHeaderParser(),
      const StacForuiSeparatorParser(),
      const StacForuiButtonParser(),
      const StacForuiTextFieldParser(),
      const StacForuiSwitchParser(),
    ]);
  }
}
