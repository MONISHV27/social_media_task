import 'package:dart_either/dart_either.dart';
import 'package:social_media/core/exceptions/auth_exceptions.dart';
import 'package:social_media/core/services/failure_result.dart';
import 'package:social_media/features/authentication/login/data/entities/register_entity.dart';
import 'package:social_media/features/authentication/login/data/repository/login_repository.dart';
import 'package:social_media/features/authentication/login/data/services/login_service.dart';

class LoginRepositoryImpl implements LoginRepository {
  final LoginService service;

  const LoginRepositoryImpl({required this.service});
  @override
  Future<Either<FailureResult, String?>> login(
    RegisterEntity userEntity,
  ) async {
    try {
      return Right(await service.login(userEntity.toModel()));
    } on AuthException catch (e) {
      return Left(ResponseFailed(message: e.message));
    } catch (e) {
      return Left(ResponseFailed());
    }
  }
}
