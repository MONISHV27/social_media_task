import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/features/form_builder/view_model/fomr_provider.dart';

class FormFieldElementMapper<T> extends StatelessWidget {
  final Widget Function(FormFieldState<T>) formbuilder;
  final String? Function(T?)? validator;
  final String formKey;
  const FormFieldElementMapper({
    super.key,
    required this.formbuilder,
    this.validator,
    required this.formKey,
  });

  @override
  Widget build(BuildContext context) {
    return FormField(
      builder: formbuilder,
      validator: validator,
      onSaved: (val) {
        context.read<FormProvider>().onSave(formKey, val);
      },
    );
  }
}
