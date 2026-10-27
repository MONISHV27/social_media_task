import 'package:flutter/material.dart';
import 'package:social_media/common/widgets/form_builder_widgets/text_field_element_widget.dart';
import 'package:social_media/core/enums/textfield_element_type_enum.dart';
import 'package:social_media/core/validators/email_validator.dart';
import 'package:social_media/core/validators/name_validator.dart';
import 'package:social_media/core/validators/number_validator.dart';
import 'package:social_media/core/validators/password_validator.dart';
import 'package:social_media/core/validators/validator_manager.dart';
import 'package:social_media/features/form_builder/data/form_element_manager/form_element.dart';

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

  factory TextFieldFormMetadata.fromJson(Map<String, dynamic> json) {
    final bool isRequired = json['required'] as bool? ?? false;
    return TextFieldFormMetadata(
      key: json['key'] as String,
      isRequired: isRequired,
      fieldType: TextFieldElementTypeEnum.getType(
        json['field_type'] as String? ?? '',
      ),
      label: json['label'] as String?,
      placeholder: json['placeholder'] as String?,
      min: json['min'] as int?,
      max: json['max'] as int?,
      validator: switch (TextFieldElementTypeEnum.getType(
        json['field_type'] as String? ?? '',
      )) {
        TextFieldElementTypeEnum.mail => EmailValidator(isRequired),
        TextFieldElementTypeEnum.normal => NameValidator(
          min: json['min'] as int?,
          max: json['max'] as int?,
          isRequired: isRequired,
        ),
        TextFieldElementTypeEnum.password => PasswordValidator(isRequired),
        TextFieldElementTypeEnum.number => NumberValidator(
          isRequired: isRequired,
          min: json['min'] as int?,
          max: json['max'] as int?,
        ),
      },
    );
  }

  @override
  Widget buildWidgetElement() {
    return TextFieldElement(data: this);
  }
}
