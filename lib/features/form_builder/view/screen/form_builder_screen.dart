import 'package:flutter/material.dart';
import 'package:social_media/features/form_builder/data/form_element_manager/form_element.dart';
import 'package:social_media/features/form_builder/data/form_factory/form_builder_factory.dart';

class FormBuilderScreen extends StatelessWidget {
  const FormBuilderScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<FormElement> elements = FormBuilder().getMetadata({
      'fields': [
        {
          "element": "text_field",
          "field_type": 'email',

          "id": "full_name",
          "type": "text",
          "label": "Full Name",
          "placeholder": "Enter your full name",
          "required": true,
          "minLength": 3,
          "maxLength": 50,
        },
      ],
    });
    return Scaffold(
      body: ListView.builder(
        itemCount: elements.length,
        itemBuilder: (context, index) {
          return SizedBox(
            height: 100,
            child: elements[index].buildWidgetElement(),
          );
        },
      ),
    );
  }
}
