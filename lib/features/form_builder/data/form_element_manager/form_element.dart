import 'package:flutter/material.dart';

abstract class FormElement {
  final String key;
  const FormElement({required this.key});
  Widget buildWidgetElement();
}
