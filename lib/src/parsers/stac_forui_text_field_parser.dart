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
    final prefix = Stac.fromJson(model.prefix, context);
    final suffix = Stac.fromJson(model.suffix, context);

    return FTextField(
      key: model.key != null ? ValueKey<String>(model.key!) : null,
      control: FTextFieldControl.managed(
        onChange: model.onChange != null
            ? (value) => Stac.onCallFromJson(model.onChange, context)
            : null,
      ),
      label: model.label != null ? Text(model.label!) : null,
      description:
          model.description != null ? Text(model.description!) : null,
      hint: model.hint,
      error: model.error != null ? Text(model.error!) : null,
      prefixBuilder: prefix != null
          ? (context, style, variants) => FTextField.prefixIconBuilder(context, style, variants, prefix)
          : null,
      suffixBuilder: suffix != null
          ? (context, style, variants) => Padding(
                padding: const EdgeInsetsDirectional.only(start: 4.0, end: 12.0),
                child: IconTheme(data: style.iconStyle.resolve(variants), child: suffix),
              )
          : null,
      obscureText: model.obscureText,
      onSubmit: model.onSubmit != null
          ? (value) => Stac.onCallFromJson(model.onSubmit, context)
          : null,
    );
  }
}
