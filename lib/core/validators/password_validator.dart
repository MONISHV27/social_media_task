import 'package:social_media/core/validators/validator_manager.dart';

class PasswordValidator implements Validator {
  final bool isRequired;
  const PasswordValidator(this.isRequired);
  static const pattern =
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';

  RegExp get _pattern => RegExp(pattern);

  @override
  String? validate(String? value) {
    value = value ?? '';

    if (value.isEmpty) {
      return 'Password is required';
    }
    if (value.length < 8) {
      return 'Password must be at least 8 characters';
    }
    if (!_pattern.hasMatch(value)) {
      return 'Password contains at least one: A-Z, 0-9 and (!,@,#,\$)';
    }

    return null;
  }
}
