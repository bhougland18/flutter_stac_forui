import 'package:flutter/widgets.dart';
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

  test('StacForuiDivider model parses correctly', () {
    final Map<String, dynamic> dividerJson = {
      'key': 'my_divider',
      'axis': 'vertical',
      'color': '#ff0000',
    };

    final divider = StacForuiDivider.fromJson(dividerJson);
    expect(divider.key, 'my_divider');
    expect(divider.axis, Axis.vertical);
    expect(divider.color, '#ff0000');
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

  test('StacForuiCard model parses correctly', () {
    final Map<String, dynamic> cardJson = {
      'key': 'my_card',
      'title': 'Card Title',
      'rawTitle': {'type': 'text', 'data': 'Raw Title'},
      'subtitle': 'Card Subtitle',
      'rawSubtitle': {'type': 'text', 'data': 'Raw Subtitle'},
      'child': {'type': 'text', 'data': 'Card Content'},
    };

    final card = StacForuiCard.fromJson(cardJson);
    expect(card.key, 'my_card');
    expect(card.title, 'Card Title');
    expect(card.rawTitle?['data'], 'Raw Title');
    expect(card.subtitle, 'Card Subtitle');
    expect(card.rawSubtitle?['data'], 'Raw Subtitle');
    expect(card.child?['type'], 'text');
  });

  test('StacForuiBadge model parses correctly', () {
    final Map<String, dynamic> badgeJson = {
      'key': 'my_badge',
      'label': 'New',
      'style': 'secondary',
    };

    final badge = StacForuiBadge.fromJson(badgeJson);
    expect(badge.key, 'my_badge');
    expect(badge.label, 'New');
    expect(badge.style, StacForuiBadgeStyle.secondary);
  });

  test('StacForuiTabs model parses correctly', () {
    final Map<String, dynamic> tabsJson = {
      'key': 'my_tabs',
      'initialIndex': 1,
      'scrollable': true,
      'entries': [
        {
          'label': 'Tab 1',
          'child': {'type': 'text', 'data': 'Content 1'},
        },
        {
          'label': 'Tab 2',
          'child': {'type': 'text', 'data': 'Content 2'},
        },
      ],
      'onChange': {'type': 'log', 'message': 'Tab pressed'},
    };

    final tabs = StacForuiTabs.fromJson(tabsJson);
    expect(tabs.key, 'my_tabs');
    expect(tabs.initialIndex, 1);
    expect(tabs.scrollable, true);
    expect(tabs.entries?.length, 2);
    expect(tabs.entries?[0].label, 'Tab 1');
    expect(tabs.entries?[0].child?['data'], 'Content 1');
    expect(tabs.onChange?['type'], 'log');
  });

  test('StacForuiDialog model parses correctly', () {
    final Map<String, dynamic> dialogJson = {
      'key': 'my_dialog',
      'title': 'Dialog Title',
      'body': 'Dialog Body',
      'axis': 'horizontal',
      'actions': [
        {'type': 'forui_button', 'label': 'Action 1'},
      ],
    };

    final dialog = StacForuiDialog.fromJson(dialogJson);
    expect(dialog.key, 'my_dialog');
    expect(dialog.title, 'Dialog Title');
    expect(dialog.body, 'Dialog Body');
    expect(dialog.axis, Axis.horizontal);
    expect(dialog.actions.length, 1);
    expect(dialog.actions[0]['label'], 'Action 1');
  });

  test('StacForuiAvatar model parses correctly', () {
    final Map<String, dynamic> avatarJson = {
      'key': 'my_avatar',
      'image': 'https://example.com/avatar.png',
      'size': 50.0,
      'fallback': {'type': 'text', 'data': 'JD'},
    };

    final avatar = StacForuiAvatar.fromJson(avatarJson);
    expect(avatar.key, 'my_avatar');
    expect(avatar.image, 'https://example.com/avatar.png');
    expect(avatar.size, 50.0);
    expect(avatar.fallback?['type'], 'text');
  });

  test('StacForuiAccordion model parses correctly', () {
    final Map<String, dynamic> accordionJson = {
      'key': 'my_accordion',
      'maxExpanded': 2,
      'children': [
        {
          'type': 'forui_accordion_item',
          'title': {'type': 'text', 'data': 'Title 1'},
          'child': {'type': 'text', 'data': 'Content 1'},
        }
      ],
    };

    final accordion = StacForuiAccordion.fromJson(accordionJson);
    expect(accordion.key, 'my_accordion');
    expect(accordion.maxExpanded, 2);
    expect(accordion.children.length, 1);
    expect(accordion.children[0]['type'], 'forui_accordion_item');
  });

  test('StacForuiCheckbox model parses correctly', () {
    final Map<String, dynamic> checkboxJson = {
      'key': 'my_checkbox',
      'label': 'Accept',
      'value': true,
      'onChange': {'type': 'log', 'message': 'Checked'},
    };

    final checkbox = StacForuiCheckbox.fromJson(checkboxJson);
    expect(checkbox.key, 'my_checkbox');
    expect(checkbox.label, 'Accept');
    expect(checkbox.value, true);
    expect(checkbox.onChange?['type'], 'log');
  });

  test('StacForuiSlider model parses correctly', () {
    final Map<String, dynamic> sliderJson = {
      'key': 'my_slider',
      'label': 'Volume',
      'initialMax': 0.5,
      'marks': [
        {'value': 0.0, 'label': 'Min'},
        {'value': 1.0, 'label': 'Max'},
      ],
      'onEnd': {'type': 'log', 'message': 'Slider end'},
    };

    final slider = StacForuiSlider.fromJson(sliderJson);
    expect(slider.key, 'my_slider');
    expect(slider.label, 'Volume');
    expect(slider.initialMax, 0.5);
    expect(slider.marks?.length, 2);
    expect(slider.marks?[0].label, 'Min');
    expect(slider.onEnd?['type'], 'log');
  });

  test('StacForuiAlert model parses correctly', () {
    final Map<String, dynamic> alertJson = {
      'key': 'my_alert',
      'title': 'Heads Up!',
      'variant': 'destructive',
    };

    final alert = StacForuiAlert.fromJson(alertJson);
    expect(alert.key, 'my_alert');
    expect(alert.title, 'Heads Up!');
    expect(alert.variant, StacForuiAlertVariant.destructive);
  });

  test('StacForuiProgress model parses correctly', () {
    final Map<String, dynamic> progressJson = {
      'key': 'my_progress',
      'value': 0.75,
    };

    final progress = StacForuiProgress.fromJson(progressJson);
    expect(progress.key, 'my_progress');
    expect(progress.value, 0.75);
  });

  test('StacForuiToaster model parses correctly', () {
    final Map<String, dynamic> toasterJson = {
      'key': 'my_toaster',
      'child': {'type': 'text', 'data': 'Toaster Content'},
    };

    final toaster = StacForuiToaster.fromJson(toasterJson);
    expect(toaster.key, 'my_toaster');
    expect(toaster.child['data'], 'Toaster Content');
  });

  test('StacForuiTooltip model parses correctly', () {
    final Map<String, dynamic> tooltipJson = {
      'key': 'my_tooltip',
      'tip': {'type': 'text', 'data': 'Tip'},
      'child': {'type': 'text', 'data': 'Child'},
    };

    final tooltip = StacForuiTooltip.fromJson(tooltipJson);
    expect(tooltip.key, 'my_tooltip');
    expect(tooltip.tip['data'], 'Tip');
    expect(tooltip.child?['data'], 'Child');
  });

  test('StacForuiPopover model parses correctly', () {
    final Map<String, dynamic> popoverJson = {
      'key': 'my_popover',
      'popover': {'type': 'text', 'data': 'Popover'},
      'child': {'type': 'text', 'data': 'Child'},
    };

    final popover = StacForuiPopover.fromJson(popoverJson);
    expect(popover.key, 'my_popover');
    expect(popover.popover['data'], 'Popover');
    expect(popover.child?['data'], 'Child');
  });

  test('StacForuiTooltipGroup model parses correctly', () {
    final Map<String, dynamic> groupJson = {
      'key': 'my_group',
      'child': {'type': 'text', 'data': 'Group Content'},
    };

    final group = StacForuiTooltipGroup.fromJson(groupJson);
    expect(group.key, 'my_group');
    expect(group.child['data'], 'Group Content');
  });

  test('StacForuiResizable model parses correctly', () {
    final Map<String, dynamic> resizableJson = {
      'key': 'my_resizable',
      'axis': 'vertical',
      'children': [
        {
          'initialExtent': 100.0,
          'child': {'type': 'text', 'data': 'Region 1'},
        }
      ],
    };

    final resizable = StacForuiResizable.fromJson(resizableJson);
    expect(resizable.key, 'my_resizable');
    expect(resizable.axis, Axis.vertical);
    expect(resizable.children.length, 1);
    expect(resizable.children[0].initialExtent, 100.0);
  });

  test('StacForuiCollapsible model parses correctly', () {
    final Map<String, dynamic> collapsibleJson = {
      'key': 'my_collapsible',
      'value': 1.0,
      'child': {'type': 'text', 'data': 'Collapsible Content'},
    };

    final collapsible = StacForuiCollapsible.fromJson(collapsibleJson);
    expect(collapsible.key, 'my_collapsible');
    expect(collapsible.value, 1.0);
    expect(collapsible.child['data'], 'Collapsible Content');
  });

  test('StacForuiRadio model parses correctly', () {
    final Map<String, dynamic> radioJson = {
      'key': 'my_radio',
      'label': 'Option 1',
      'value': true,
    };

    final radio = StacForuiRadio.fromJson(radioJson);
    expect(radio.key, 'my_radio');
    expect(radio.label, 'Option 1');
    expect(radio.value, true);
  });

  test('StacForuiSelectGroup model parses correctly', () {
    final Map<String, dynamic> selectGroupJson = {
      'key': 'my_select_group',
      'items': [
        {'value': '1', 'label': 'Item 1'},
        {'value': '2', 'label': 'Item 2'},
      ],
      'initialValues': ['1'],
    };

    final selectGroup = StacForuiSelectGroup.fromJson(selectGroupJson);
    expect(selectGroup.key, 'my_select_group');
    expect(selectGroup.items.length, 2);
    expect(selectGroup.initialValues?.contains('1'), true);
  });

  test('StacForuiCalendar model parses correctly', () {
    final Map<String, dynamic> calendarJson = {
      'key': 'my_calendar',
      'initialDate': '2024-01-01T00:00:00.000',
    };

    final calendar = StacForuiCalendar.fromJson(calendarJson);
    expect(calendar.key, 'my_calendar');
    expect(calendar.initialDate, DateTime(2024, 1, 1));
  });

  test('StacForuiBreadcrumb model parses correctly', () {
    final Map<String, dynamic> breadcrumbJson = {
      'key': 'my_breadcrumb',
      'children': [
        {
          'type': 'forui_breadcrumb_item',
          'child': {'type': 'text', 'data': 'Home'},
        }
      ],
    };

    final breadcrumb = StacForuiBreadcrumb.fromJson(breadcrumbJson);
    expect(breadcrumb.key, 'my_breadcrumb');
    expect(breadcrumb.children.length, 1);
    expect(breadcrumb.children[0]['type'], 'forui_breadcrumb_item');
  });
}
