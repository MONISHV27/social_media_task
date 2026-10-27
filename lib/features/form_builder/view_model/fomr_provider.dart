import 'package:social_media/features/form_builder/data/form_element_manager/form_element.dart';
import 'package:social_media/features/form_builder/data/form_factory/form_builder_factory.dart';
import 'package:social_media/features/form_builder/data/models/form_builder_json.dart';

class FormProvider {
  List<FormElement> elements = [];
  final FormBuilderJson formBuilder;
  FormProvider({required this.formBuilder}) {
    elements = FormBuilder.getMetadata(formBuilder.json);
  }

  List<FormElement> get formElements => elements;

  final Map<String, dynamic> _formData = {};

  Map<String, dynamic> get formData => _formData;

  void onSave(String key, dynamic value) {
    _formData[key] = value;
  }
}
