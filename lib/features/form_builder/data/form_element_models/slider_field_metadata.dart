import 'package:flutter/material.dart';
import 'package:social_media/common/widgets/form_builder_widgets/slider_field_element.dart';
import 'package:social_media/features/form_builder/data/form_element_manager/form_element.dart';

class SliderFieldMetadata extends FormElement {
  final String label;
  final double min;
  final double max;
  final int? divisions;
  final bool required;

  SliderFieldMetadata({
    required this.label,
    required this.min,
    required this.max,
    required this.divisions,
    required this.required,
    required super.key,
  });

  factory SliderFieldMetadata.fromJson(Map<String, dynamic> json) {
    return SliderFieldMetadata(
      key: json['key'] as String,

      label: json['label'] as String? ?? '',
      min: (json['min'] as int? ?? 0).toDouble(),
      max: (json['max'] as int? ?? 0).toDouble(),
      divisions: json['divisions'] as int?,
      required: json['required'] as bool? ?? false,
    );
  }

  @override
  Widget buildWidgetElement() {
    return SliderFieldElement(metaData: this);
  }
}
