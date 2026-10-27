import 'package:flutter/material.dart';
import 'package:social_media/common/constants/spacing_constants.dart';
import 'package:social_media/common/widgets/form_builder_widgets/radio_field_element.dart';
import 'package:social_media/features/form_builder/data/form_element_models/checkbox_multi_field_metadata.dart';
import 'package:social_media/features/form_builder/view/widgets/form_field_mapper.dart';

class CheckboxFieldElement extends StatelessWidget {
  const CheckboxFieldElement({super.key});

  @override
  Widget build(BuildContext context) {
    return FormFieldElementMapper(
      formKey: '',
      //  onReset: () => _controller.clear(),
      // initialValue: widget.initialValue,
      // autovalidateMode: AutovalidateMode.onUserInteraction,
      // validator: (value) {
      //   // return widget.dependency.validate(value);
      // },
      // onSaved: (value) {
      //   // if (widget.onFormSaved != null) {
      //   //   widget.onFormSaved!(value ?? '');
      //   // }
      // },
      formbuilder: (state) {
        // if (state.hasError) {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     _errorTextNotifier.value = state.errorText;
        //   });
        // }
        // if (_errorTextNotifier.value != null &&
        //     !state.hasError &&
        //     (_errorTextNotifier.value ?? '').isNotEmpty) {
        //   WidgetsBinding.instance.addPostFrameCallback((_) {
        //     _errorTextNotifier.value = state.errorText;
        //   });

        return Column(
          children: [
            CheckboxListTile(onChanged: (val) {}, value: null),
            if (state.hasError) FieldErrorText(text: state.errorText ?? ''),
          ],
        );
      },
    );
    // builder:(context)=> Checkbox(value: value, onChanged: onChanged));
  }
}

class CheckboxMultiFieldElement extends StatefulWidget {
  final CheckBoxMultiFieldMetadata metaData;
  const CheckboxMultiFieldElement({super.key, required this.metaData});

  @override
  State<CheckboxMultiFieldElement> createState() =>
      _CheckboxMultiFieldElementState();
}

class _CheckboxMultiFieldElementState extends State<CheckboxMultiFieldElement> {
  Set<String> selected = {}; // Set to hold selected items

  @override
  Widget build(BuildContext context) {
    return FormFieldElementMapper(
      validator: (value) => widget.metaData.required
          ? (selected.isEmpty ? 'Select a ${widget.metaData.label}' : null)
          : null,

      formbuilder: (FormFieldState state) => Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DropdownButtonFormField(
            hint: Text(widget.metaData.label ?? ''),
            onChanged: (x) {},
            items: widget.metaData.options.map((e) {
              return DropdownMenuItem(
                value: e,

                child: StatefulBuilder(
                  builder: (context, menuSetState) {
                    return InkWell(
                      onTap: () {
                        setState(() {
                          if ((selected.contains(e)) != true) {
                            selected.add(e);
                          } else {
                            selected.remove(e);
                          }
                        });
                        state.didChange(selected);
                        menuSetState(() {});
                      },
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IgnorePointer(
                            child: Checkbox(
                              value: selected.contains(e),
                              onChanged: (bool? checked) {},
                            ),
                          ),
                          const SizedBox(
                            width: 8,
                          ), // Small spacing between checkbox and text
                          Text(e, style: const TextStyle(fontSize: 16)),
                        ],
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),

          if (selected.isNotEmpty) ...{
            SizedBox(height: SpacingConstants.formFieldErrorSpacing),

            Text(
              selected.isEmpty ? '' : 'Select items: ${selected.join(' , ')}',
              style: TextStyle(fontSize: 16),
            ),
          },

          SizedBox(height: SpacingConstants.formFieldErrorSpacing),
          if (state.hasError) FieldErrorText(text: state.errorText ?? ''),
        ],
      ),
      formKey: widget.metaData.key,
    );
  }
}
