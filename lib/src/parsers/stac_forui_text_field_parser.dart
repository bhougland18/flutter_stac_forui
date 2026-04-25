import 'package:flutter/widgets.dart';
import 'package:forui/forui.dart';
import 'package:stac/stac.dart';
import 'package:stac_forui_components/src/models/stac_forui_text_field.dart';

class StacForuiTextFieldParser extends StacParser<StacForuiTextField> {
  const StacForuiTextFieldParser();

  @override
  String get type => 'forui_text_field';

  @override
  StacForuiTextField getModel(Map<String, dynamic> json) =>
      StacForuiTextField.fromJson(json);

  @override
  Widget parse(BuildContext context, StacForuiTextField model) {
    return KeyedSubtree(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      child: FTextField(
        label: model.label,
        help: model.description,
        hint: model.hint,
        error: model.error,
        // prefixIcon is not supported by FTextField 0.1.0, so we only map suffix to suffixIcon
        suffixIcon: Stac.fromJson(model.suffix, context),
        obscureText: model.obscureText,
        onChange: model.onChange != null
            ? (value) => Stac.onCallFromJson(model.onChange, context)
            : null,
        onSubmit: model.onSubmit != null
            ? (value) => Stac.onCallFromJson(model.onSubmit, context)
            : null,
      ),
    );
  }
}
