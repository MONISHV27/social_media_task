import 'package:flutter/material.dart';
import 'package:social_media/common/widgets/form_builder_widgets/text_field_element_widget.dart';
import 'package:social_media/core/enums/textfield_element_type_enum.dart';
import 'package:social_media/features/form_builder/data/form_element_manager/form_element.dart';

class TextFieldFormMetadata extends FormElement {
  final String? label;
  final String? placeholder;
  final bool isRequired;
  final int? min;
  final int? max;
  final TextFieldElementTypeEnum fieldType;

  const TextFieldFormMetadata({
    required this.label,
    required this.placeholder,
    required this.isRequired,
    required this.min,
    required this.max,
    required this.fieldType,
  });

  // "element" : '"text_field"
  //  field_type: 'email, password,
  //  {
  //       "id": "full_name",
  //       "type": "text",
  //       "label": "Full Name",
  //       "placeholder": "Enter your full name",
  //       "required": true,
  //       "minLength": 3,
  //       "maxLength": 50
  //     },
  factory TextFieldFormMetadata.fromJson(Map<String, dynamic> json) {
    //  {
    // "element" : '"text_field"
    //  field_type: 'email, password,

    //       "id": "full_name",
    //       "type": "text",
    //       "label": "Full Name",
    //       "placeholder": "Enter your full name",
    //       "required": true,
    //       "minLength": 3,
    //       "maxLength": 50
    //     },

    return TextFieldFormMetadata(
      isRequired: json['required'] as bool? ?? false,
      fieldType: TextFieldElementTypeEnum.getType('field_type'),
      label: json['label'] as String?,
      placeholder: json['placeholder'] as String?,
      min: json['minLength'] as int?,
      max: json['maxLength'] as int?,
    );
  }

  @override
  Widget buildWidgetElement() {
    return TextFieldElement(data: this);
  }
}
