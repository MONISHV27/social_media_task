import 'package:flutter/material.dart';
import 'package:social_media/features/form_builder/data/form_element_models/textfield_metadata.dart';

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
    return TextFormField(initialValue: 'type');
  }
}
