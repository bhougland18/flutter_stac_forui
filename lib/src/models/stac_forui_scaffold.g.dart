// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'stac_forui_scaffold.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

StacForuiScaffold _$StacForuiScaffoldFromJson(Map<String, dynamic> json) =>
    StacForuiScaffold(
      key: json['key'] as String?,
      header: json['header'] as Map<String, dynamic>?,
      content: json['content'] as Map<String, dynamic>?,
      footer: json['footer'] as Map<String, dynamic>?,
      style: json['style'] == null
          ? null
          : StacForuiScaffoldStyle.fromJson(
              json['style'] as Map<String, dynamic>,
            ),
    );

Map<String, dynamic> _$StacForuiScaffoldToJson(StacForuiScaffold instance) =>
    <String, dynamic>{
      'type': instance.type,
      'key': instance.key,
      'header': instance.header,
      'content': instance.content,
      'footer': instance.footer,
      'style': instance.style,
    };

StacForuiScaffoldStyle _$StacForuiScaffoldStyleFromJson(
  Map<String, dynamic> json,
) => StacForuiScaffoldStyle(
  backgroundColor: json['backgroundColor'] as String?,
  sidebarBackgroundColor: json['sidebarBackgroundColor'] as String?,
  childPadding: json['childPadding'] as Map<String, dynamic>?,
);

Map<String, dynamic> _$StacForuiScaffoldStyleToJson(
  StacForuiScaffoldStyle instance,
) => <String, dynamic>{
  'backgroundColor': instance.backgroundColor,
  'sidebarBackgroundColor': instance.sidebarBackgroundColor,
  'childPadding': instance.childPadding,
};
