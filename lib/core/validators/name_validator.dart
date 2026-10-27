import 'package:social_media/core/validators/validator_manager.dart';

class NameValidator implements Validator {
  final int? min;
  final int? max;
  final bool isRequired;
  const NameValidator({this.min, this.max, required this.isRequired});
  @override
  String? validate(String? value) {
    if (((value ?? '').isEmpty || value == null) && isRequired) {
      return 'Please Enter the name';
    }
    if (min != null && (value ?? '').length < (min ?? 0)) {
      return 'minimum $min characters needed';
    }
    if (max != null && (value ?? '').length > (max ?? 0)) {
      return 'maximum  $max characters allowed';
    }
    return null;
  }
}
