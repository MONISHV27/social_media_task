import 'package:flutter/material.dart';
import 'package:social_media/common/widgets/form_builder_widgets/text_field_element_widget.dart';
import 'package:social_media/core/enums/textfield_element_type_enum.dart';
import 'package:social_media/features/form_builder/data/form_element_manager/form_element.dart';

abstract class Validator {
  String? validate(String? value);
}

class EmailValidator implements Validator {
  const EmailValidator();

  static const _regEX =
      r"(?:[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'"
      r'*+/=?^_`{|}~-]+)*|"(?:[\x01-\x08\x0b\x0c\x0e-\x1f\x21\x23-\x5b\x5d-'
      r'\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])*")@(?:(?:[a-z0-9](?:[a-z0-9-]*'
      r'[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\[(?:(?:(2(5[0-5]|[0-4]'
      r'[0-9])|1[0-9][0-9]|[1-9]?[0-9]))\.){3}(?:(2(5[0-5]|[0-4][0-9])|1[0-9]'
      r'[0-9]|[1-9]?[0-9])|[a-z0-9-]*[a-z0-9]:(?:[\x01-\x08\x0b\x0c\x0e-\x1f\'
      r'x21-\x5a\x53-\x7f]|\\[\x01-\x09\x0b\x0c\x0e-\x7f])+)\])';
  RegExp get _pattern => RegExp(_regEX);

  @override
  String? validate(String? value) {
    value = value ?? '';
    if (value.isEmpty) {
      return 'Email address is required';
    }
    if (!_pattern.hasMatch(value)) {
      return 'Enter a valid email address';
    }

    return null;
  }
}

class NameValidator implements Validator {
  final int? min;
  final int? max;
  final bool isRequired;
  const NameValidator({this.min, this.max, required this.isRequired});
  @override
  String? validate(String? value) {
    if (((value ?? '').isEmpty || value == null) && isRequired) {
      return 'Please Enter the name';
    }
    if (min != null && (value ?? '').length < (min ?? 0)) {
      return 'minimum $min characters needed';
    }
    if (max != null && (value ?? '').length > (max ?? 0)) {
      return 'maximum  $max characters allowed';
    }
    return null;
  }
}

class TextFieldFormMetadata extends FormElement {
  final String? label;
  final String? placeholder;
  final bool isRequired;
  final int? min;
  final int? max;
  final TextFieldElementTypeEnum fieldType;
  final Validator? validator;

  const TextFieldFormMetadata({
    required this.label,
    required this.placeholder,
    required this.isRequired,
    required this.min,
    required this.max,
    required this.fieldType,
    required this.validator,
    required super.key,
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
    final bool isRequired = json['required'] as bool? ?? false;
    return TextFieldFormMetadata(
      key: json['key'] as String,
      isRequired: isRequired,
      fieldType: TextFieldElementTypeEnum.getType('field_type'),
      label: json['label'] as String?,
      placeholder: json['placeholder'] as String?,
      min: json['minLength'] as int?,
      max: json['maxLength'] as int?,
      validator: switch (TextFieldElementTypeEnum.getType('field_type')) {
        TextFieldElementTypeEnum.email => EmailValidator(),
        TextFieldElementTypeEnum.normal => NameValidator(
          min: json['minLength'] as int?,
          max: json['maxLength'] as int?,
          isRequired: isRequired,
        ),
        _ => null,
      },
    );
  }

  @override
  Widget buildWidgetElement() {
    return TextFieldElement(data: this);
  }
}
