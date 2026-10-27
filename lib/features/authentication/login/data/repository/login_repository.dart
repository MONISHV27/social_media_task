import 'package:dart_either/dart_either.dart';
import 'package:social_media/core/services/failure_result.dart';
import 'package:social_media/features/authentication/login/data/entities/register_entity.dart';

abstract class LoginRepository {
  Future<Either<FailureResult, String?>> login(RegisterEntity userEntity);
}
