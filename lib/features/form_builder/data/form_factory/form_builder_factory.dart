import 'package:social_media/features/form_builder/data/form_element_manager/form_element.dart';
import 'package:social_media/features/form_builder/data/form_element_models/textfield_metadata.dart';

class FormBuilder {
  List<FormElement> getMetadata(Map<String, dynamic> json) {
    final List<FormElement> elements = [];
    for (Map<String, dynamic> metaData in (List.from(json['fields']))) {
      switch (metaData['element']) {
        case 'text_field':
          elements.add(TextFieldFormMetadata.fromJson(metaData));
          break;
      }
    }
    return elements;
  }
}
