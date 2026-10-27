import 'package:flutter/material.dart';
import 'package:social_media/common/widgets/form_builder_widgets/check_box_field_element.dart';
import 'package:social_media/features/form_builder/data/form_element_manager/form_element.dart';

class CheckBoxMultiFieldMetadata extends FormElement {
  final String? label;
  final bool required;
  final List<String> options;

  CheckBoxMultiFieldMetadata({
    required super.key,
    required this.label,
    required this.required,
    required this.options,
  });

  factory CheckBoxMultiFieldMetadata.fromJson(Map<String, dynamic> json) {
    return CheckBoxMultiFieldMetadata(
      key: json['key'] as String,

      label: json['label'] as String?,
      required: json['required'] as bool? ?? false,
      options: json['options'] as List<String>? ?? [],
    );
  }

  @override
  Widget buildWidgetElement() {
    return CheckboxMultiFieldElement(metaData: this);
  }
}
