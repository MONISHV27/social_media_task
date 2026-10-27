import 'package:social_media/features/authentication/login/data/repository/login_repository.dart';
import 'package:social_media/features/authentication/login/data/repository/register_repository.dart';

class AuthenticationViewmodel {
  final LoginRepository loginRepository;
  final RegisterRepository registerRepository;

  const AuthenticationViewmodel({
    required this.loginRepository,
    required this.registerRepository,
  });

  Future<bool> login() async {
    return Future.value(true);
  }

  Future<void> createAccount() async {}
}
