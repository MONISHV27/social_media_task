import 'package:flutter/material.dart';
import 'package:social_media/common/widgets/form_builder_widgets/radio_field_element.dart';
import 'package:social_media/features/form_builder/data/form_element_manager/form_element.dart';

class RadioFieldMetadata extends FormElement {
  final String label;
  final bool required;
  final List<String> options;

  RadioFieldMetadata({
    required this.label,
    required this.required,
    required this.options,
    required super.key,
  });

  factory RadioFieldMetadata.fromJson(Map<String, dynamic> json) {
    return RadioFieldMetadata(
      key: json['key'] as String,

      label: json['label'] as String? ?? '',
      required: json['required'] as bool? ?? false,
      options: List.from(json['options'] as List? ?? []),
    );
  }

  @override
  Widget buildWidgetElement() {
    return RadioFieldElement(metaData: this);
  }
}
