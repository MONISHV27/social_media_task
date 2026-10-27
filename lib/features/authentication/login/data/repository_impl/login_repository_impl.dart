import 'package:social_media/features/authentication/login/data/repository/login_repository.dart';
import 'package:social_media/features/authentication/login/data/services/login_service.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginService service;

  const LoginRepositoryImpl({required this.service});
  @override
  Future<dynamic> login() async {
    // TODO: implement login
  }
}
