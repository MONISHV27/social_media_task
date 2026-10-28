import 'package:flutter/material.dart';
import 'package:social_media/common/constants/spacing_constants.dart';
import 'package:social_media/common/theme/field_border_style.dart';
import 'package:social_media/common/widgets/textfield_label_widget.dart';
import 'package:social_media/core/validators/validator_manager.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final Function(String? value) onSave;
  final Validator? validator;
  final TextInputType? keyboardType;
  const CustomTextField({
    super.key,
    required this.label,
    this.keyboardType,
    this.validator,
    required this.onSave,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  final TextEditingController _controller = TextEditingController();

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
        TextFieldLabelWidget(text: widget.label),
        const SizedBox(height: SpacingConstants.formFieldLabelSpacing),
        Material(
          color: Colors.white,
          elevation: 6.0,
          shadowColor: Colors.black.withValues(alpha: 0.2),
          child: TextFormField(
            onTapOutside: (event) =>
                FocusManager.instance.primaryFocus?.unfocus(),
            onSaved: widget.onSave,
            validator: (value) => widget.validator?.validate(value),
            keyboardType: widget.keyboardType,
            controller: _controller,
            decoration: InputDecoration(
              errorBorder: FieldBorderStyle.customFieldborderStyle,
              focusedBorder: FieldBorderStyle.customFieldborderStyle,
              disabledBorder: FieldBorderStyle.customFieldborderStyle,
              enabledBorder: FieldBorderStyle.customFieldborderStyle,
              border: FieldBorderStyle.customFieldborderStyle,
            ),
          ),
        ),
      ],
    );
  }
}
