import 'package:social_media/core/validators/validator_manager.dart';

class NumberValidator implements Validator {
  final bool isRequired;
  final int? min;
  final int? max;
  const NumberValidator({required this.isRequired, this.max, this.min});
  @override
  String? validate(String? value) {
    if (value == null && isRequired) {
      return 'Enter the number';
    }

    if (min != null && ((value ?? '').length < (min ?? 0))) {
      return 'Minimum $min character needed';
    }
    if (max != null && ((value ?? '').length > (max ?? 0))) {
      return 'Maximum $max character allowed';
    }
    return null;
  }
}
