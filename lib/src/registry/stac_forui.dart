import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/actions/stac_forui_show_dialog_action.dart';
import 'package:stac_forui_components/src/actions/stac_forui_show_sheet_action.dart';
import 'package:stac_forui_components/src/actions/stac_forui_show_toast_action.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_accordion_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_alert_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_avatar_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_badge_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_breadcrumb_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_button_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_calendar_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_card_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_checkbox_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_collapsible_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_dialog_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_divider_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_header_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_popover_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_progress_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_radio_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_resizable_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_scaffold_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_select_group_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_slider_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_switch_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_tabs_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_text_field_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_theme_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_tile_group_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_tile_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_toaster_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_tooltip_group_parser.dart';
import 'package:stac_forui_components/src/parsers/stac_forui_tooltip_parser.dart';

class StacForui {
  static void register() {
    Stac.initialize(
      parsers: [
        const StacForuiThemeParser(),
        const StacForuiScaffoldParser(),
        const StacForuiHeaderParser(),
        const StacForuiDividerParser(),
        const StacForuiButtonParser(),
        const StacForuiTextFieldParser(),
        const StacForuiSwitchParser(),
        const StacForuiCardParser(),
        const StacForuiBadgeParser(),
        const StacForuiTabsParser(),
        const StacForuiDialogParser(),
        const StacForuiAvatarParser(),
        const StacForuiAccordionParser(),
        const StacForuiAccordionItemParser(),
        const StacForuiCheckboxParser(),
        const StacForuiSliderParser(),
        const StacForuiAlertParser(),
        const StacForuiProgressParser(),
        const StacForuiToasterParser(),
        const StacForuiTooltipParser(),
        const StacForuiPopoverParser(),
        const StacForuiTooltipGroupParser(),
        const StacForuiResizableParser(),
        const StacForuiCollapsibleParser(),
        const StacForuiRadioParser(),
        const StacForuiSelectGroupParser(),
        const StacForuiCalendarParser(),
        const StacForuiBreadcrumbParser(),
        const StacForuiBreadcrumbItemParser(),
        const StacForuiTileGroupParser(),
        const StacForuiTileParser(),
      ],
      actionParsers: [
        const StacForuiShowToastActionParser(),
        const StacForuiShowDialogActionParser(),
        const StacForuiShowSheetActionParser(),
      ],
    );
  }
}
