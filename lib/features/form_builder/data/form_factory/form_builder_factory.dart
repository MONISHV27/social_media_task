import 'package:social_media/features/form_builder/data/form_element_manager/form_element.dart';
import 'package:social_media/features/form_builder/data/form_element_models/checkbox_multi_field_metadata.dart';
import 'package:social_media/features/form_builder/data/form_element_models/dropdown_field_metadata.dart';
import 'package:social_media/features/form_builder/data/form_element_models/radio_field_metadata.dart';
import 'package:social_media/features/form_builder/data/form_element_models/slider_field_metadata.dart';
import 'package:social_media/features/form_builder/data/form_element_models/textfield_metadata.dart';

class FormBuilder {
  static List<FormElement> getMetadata(Map<String, dynamic> json) {
    final List<FormElement> elements = [];
    for (Map<String, dynamic> metaData in (List.from(json['fields']))) {
      switch (metaData['element']) {
        case 'text_field':
          elements.add(TextFieldFormMetadata.fromJson(metaData));
          break;
        case 'checkbox_multi':
          elements.add(CheckBoxMultiFieldMetadata.fromJson(metaData));
          break;
        case 'slider':
          elements.add(SliderFieldMetadata.fromJson(metaData));
          break;
        case 'dropdown':
          elements.add(DropdownFieldMetadata.fromJson(metaData));
          break;
        case 'radio':
          elements.add(RadioFieldMetadata.fromJson(metaData));
          break;
      }
    }
    return elements;
  }
}
