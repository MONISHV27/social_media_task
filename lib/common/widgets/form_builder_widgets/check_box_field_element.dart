import 'package:flutter/material.dart';
import 'package:social_media/common/constants/spacing_constants.dart';
import 'package:social_media/common/theme/field_border_style.dart';
import 'package:social_media/common/widgets/form_builder_widgets/form_field_label_widget.dart';
import 'package:social_media/common/widgets/form_builder_widgets/radio_field_element.dart';
import 'package:social_media/features/form_builder/data/form_element_models/checkbox_multi_field_metadata.dart';
import 'package:social_media/features/form_builder/view/widgets/form_field_mapper.dart';

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
            dropdownColor: Color(0xFFfdfcfb),
            decoration: InputDecoration(
              errorBorder: FieldBorderStyle.customFieldborderStyle,
              focusedBorder: FieldBorderStyle.customFieldborderStyle,
              disabledBorder: FieldBorderStyle.customFieldborderStyle,
              enabledBorder: FieldBorderStyle.customFieldborderStyle,
              border: FieldBorderStyle.customFieldborderStyle,
            ),
            hint: FormFieldLabelWidget(text: widget.metaData.label ?? ''),

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
                              activeColor: Color(0xFFfec163),
                              value: selected.contains(e),
                              onChanged: (bool? checked) {},
                            ),
                          ),
                          const SizedBox(width: 8),
                          Text(
                            e,
                            style: const TextStyle(
                              fontSize: 16,
                              color: Color(0xFF575757),
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              );
            }).toList(),
          ),

          if (selected.isNotEmpty) ...{
            const SizedBox(height: SpacingConstants.formFieldErrorSpacing),

            Text(
              selected.isEmpty ? '' : 'Selected: ${selected.join(' , ')}',
              style: const TextStyle(
                fontSize: 16,
                color: Color(0xFF575757),
                fontWeight: FontWeight.w500,
              ),
            ),
          },

          const SizedBox(height: SpacingConstants.formFieldErrorSpacing),
          if (state.hasError) FieldErrorText(text: state.errorText ?? ''),
        ],
      ),
      formKey: widget.metaData.key,
    );
  }
}

class CheckboxFieldElement extends StatelessWidget {
  const CheckboxFieldElement({super.key});

  @override
  Widget build(BuildContext context) {
    return FormFieldElementMapper(
      formKey: '',

      formbuilder: (state) {
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
