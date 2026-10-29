import 'package:flutter/material.dart';
import 'package:social_media/common/constants/spacing_constants.dart';
import 'package:social_media/common/widgets/form_builder_widgets/form_field_label_widget.dart';
import 'package:social_media/features/form_builder/data/form_element_models/radio_field_metadata.dart';
import 'package:social_media/features/form_builder/view/widgets/form_field_mapper.dart';

class RadioFieldElement extends StatefulWidget {
  final RadioFieldMetadata metaData;
  const RadioFieldElement({super.key, required this.metaData});

  @override
  State<RadioFieldElement> createState() => _RadioFieldElementState();
}

class _RadioFieldElementState extends State<RadioFieldElement> {
  final ValueNotifier<int?> _notifier = ValueNotifier(null);
  @override
  Widget build(BuildContext context) {
    return FormFieldElementMapper(
      formKey: widget.metaData.key,
      validator: (value) {
        if (widget.metaData.required && (_notifier.value == null)) {
          return 'Select a gender';
        }
        return null;
      },
      formbuilder: (FormFieldState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ValueListenableBuilder(
              valueListenable: _notifier,
              builder: (context, value, child) {
                return RadioGroup<int>(
                  groupValue: value,

                  onChanged: (value) {
                    _notifier.value = value;

                    state.didChange(_notifier.value);
                  },
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    mainAxisSize: MainAxisSize.min, // Tell the column
                    children: <Widget>[
                      FormFieldLabelWidget(text: widget.metaData.label),
                      Wrap(
                        children: [
                          ...List.generate(widget.metaData.options.length, (
                            index,
                          ) {
                            return RadioListTile<int>(
                              activeColor: Color(0xFFff512f),
                              value: index,
                              title: Text(
                                widget.metaData.options[index],
                                style: TextStyle(
                                  fontSize: 15.0,
                                  color: Color(0xFF575757),
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            );
                          }),
                        ],
                      ),

                      // RadioListTile<Pet>(value: Pet.cat, title: Text('Cat')),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: SpacingConstants.formFieldErrorSpacing),

            if (state.hasError) FieldErrorText(text: state.errorText ?? ''),
          ],
        );
      },
    );
  }
}

class FieldErrorText extends StatelessWidget {
  final String text;
  const FieldErrorText({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,

      textAlign: TextAlign.left,
      style: const TextStyle(color: Colors.red, fontSize: 13.0),
    );
  }
}
