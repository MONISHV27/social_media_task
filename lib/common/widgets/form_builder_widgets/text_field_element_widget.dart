import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/constants/spacing_constants.dart';
import 'package:social_media/common/theme/field_border_style.dart';
import 'package:social_media/common/widgets/form_builder_widgets/form_field_label_widget.dart';
import 'package:social_media/common/widgets/form_builder_widgets/radio_field_element.dart';
import 'package:social_media/features/form_builder/data/form_element_models/textfield_metadata.dart';
import 'package:social_media/features/form_builder/view_model/fomr_provider.dart';

class TextFieldElement extends StatefulWidget {
  final TextFieldFormMetadata data;
  const TextFieldElement({super.key, required this.data});

  @override
  State<TextFieldElement> createState() => _TextFieldElementState();
}

class _TextFieldElementState extends State<TextFieldElement> {
  final TextEditingController _controller = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            FormFieldLabelWidget(text: widget.data.label ?? ''),
            if (widget.data.isRequired)
              const Text('*', style: TextStyle(color: Colors.red)),
          ],
        ),
        const SizedBox(height: SpacingConstants.formFieldLabelSpacing),

        TextFormField(
          errorBuilder: (context, errorText) => FieldErrorText(text: errorText),
          controller: _controller,
          onSaved: (newValue) =>
              (context.read<FormProvider>().onSave(widget.data.key, newValue)),
          validator: (value) => widget.data.validator?.validate(value),
          decoration: InputDecoration(
            errorBorder: FieldBorderStyle.borderStyle,
            focusedBorder: FieldBorderStyle.borderStyle,
            disabledBorder: FieldBorderStyle.borderStyle,
            enabledBorder: FieldBorderStyle.borderStyle,
            border: FieldBorderStyle.borderStyle,
          ),
        ),
      ],
    );
  }
}

// class SliderFieldElement extends StatelessWidget {
//   const SliderFieldElement({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Slider(value: value, onChanged: onChanged);
//   }
// }
