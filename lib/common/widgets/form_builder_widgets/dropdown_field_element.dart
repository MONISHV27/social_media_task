import 'package:flutter/material.dart';
import 'package:social_media/common/constants/spacing_constants.dart';
import 'package:social_media/common/widgets/form_builder_widgets/form_field_label_widget.dart';
import 'package:social_media/common/widgets/form_builder_widgets/radio_field_element.dart';
import 'package:social_media/features/form_builder/data/form_element_models/dropdown_field_metadata.dart';
import 'package:social_media/features/form_builder/view/widgets/form_field_mapper.dart';

class DropdownFieldElement extends StatefulWidget {
  final DropdownFieldMetadata metaData;
  const DropdownFieldElement({super.key, required this.metaData});

  @override
  State<DropdownFieldElement> createState() => _DropdownFieldElementState();
}

class _DropdownFieldElementState extends State<DropdownFieldElement> {
  String? _selectedItem;
  @override
  Widget build(BuildContext context) {
    return FormFieldElementMapper(
      formKey: widget.metaData.key,
      validator: (value) =>
          _selectedItem != null ? null : 'Select a ${widget.metaData.label}',
      formbuilder: (FormFieldState state) {
        return SizedBox(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              FormFieldLabelWidget(text: widget.metaData.label),
              const SizedBox(height: SpacingConstants.formFieldLabelSpacing),

              DropdownMenu<String>(
                width: double.infinity,
                // initialSelection: selectedItem,
                hintText: 'Select a ${widget.metaData.label}',
                requestFocusOnTap: true,
                enableSearch: true, // Enables searching text within the menu
                onSelected: (String? newValue) {
                  // setState(() {
                  _selectedItem = newValue;
                  state.didChange(_selectedItem);

                  // });
                },
                dropdownMenuEntries: (widget.metaData.options)
                    .map<DropdownMenuEntry<String>>((String value) {
                      return DropdownMenuEntry<String>(
                        value: value,
                        label: value,
                      );
                    })
                    .toList(),
              ),
              const SizedBox(height: SpacingConstants.formFieldErrorSpacing),

              if (state.hasError) FieldErrorText(text: state.errorText ?? ''),
            ],
          ),
        );
      },
    );
  }
}
