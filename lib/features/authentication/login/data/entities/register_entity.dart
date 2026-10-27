import 'package:social_media/features/authentication/login/data/models/register_model.dart';

class RegisterEntity {
  final String phoneNo;
  final String password;

  const RegisterEntity({required this.password, required this.phoneNo});

  RegisterModel toModel() {
    return RegisterModel(phoneNo: phoneNo, password: password);
  }
}
