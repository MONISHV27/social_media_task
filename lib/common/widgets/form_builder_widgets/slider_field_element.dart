import 'package:flutter/material.dart';
import 'package:social_media/common/constants/spacing_constants.dart';
import 'package:social_media/common/widgets/form_builder_widgets/form_field_label_widget.dart';
import 'package:social_media/common/widgets/form_builder_widgets/radio_field_element.dart';
import 'package:social_media/features/form_builder/data/form_element_models/slider_field_metadata.dart';
import 'package:social_media/features/form_builder/view/widgets/form_field_mapper.dart';

class SliderFieldElement extends StatefulWidget {
  final SliderFieldMetadata metaData;
  const SliderFieldElement({super.key, required this.metaData});

  @override
  State<SliderFieldElement> createState() => _SliderFieldElementState();
}

class _SliderFieldElementState extends State<SliderFieldElement> {
  final ValueNotifier<double> _value = ValueNotifier(0.0);

  @override
  Widget build(BuildContext context) {
    return FormFieldElementMapper(
      formKey: widget.metaData.key,
      formbuilder: (FormFieldState state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormFieldLabelWidget(text: widget.metaData.label),
            const SizedBox(height: SpacingConstants.formFieldLabelSpacing),

            ValueListenableBuilder(
              valueListenable: _value,
              builder: (context, value, child) {
                return Slider(
                  value: value,
                  onChanged: (val) {
                    _value.value = val;
                    state.didChange(_value.value);
                  },
                  min: widget.metaData.min,
                  divisions: widget.metaData.divisions,
                  max: widget.metaData.max,
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
