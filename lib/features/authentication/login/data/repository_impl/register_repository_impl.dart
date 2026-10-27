import 'package:dart_either/dart_either.dart';
import 'package:social_media/core/exceptions/auth_exceptions.dart';
import 'package:social_media/core/services/failure_result.dart';
import 'package:social_media/features/authentication/login/data/entities/register_entity.dart';
import 'package:social_media/features/authentication/login/data/repository/register_repository.dart';
import 'package:social_media/features/authentication/login/data/services/register_service.dart';

class RegisterRepositoryImpl implements RegisterRepository {
  final RegisterService service;

  const RegisterRepositoryImpl({required this.service});
  @override
  Future<Either<FailureResult, String>> createAccount(
    RegisterEntity userEntity,
  ) async {
    try {
      return Right(await service.register(userEntity.toModel()));
    } on AuthException catch (e) {
      return Left(ResponseFailed(message: e.message));
    } catch (e) {
      return Left(ResponseFailed());
    }
  }
}
