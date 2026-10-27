import 'package:flutter/foundation.dart';
import 'package:social_media/core/auth_manager/credential_hash.dart';
import 'package:social_media/features/authentication/login/data/entities/register_entity.dart';
import 'package:social_media/features/authentication/login/data/repository/login_repository.dart';
import 'package:social_media/features/authentication/login/data/repository/register_repository.dart';

class AuthenticationViewmodel extends CredentialHash {
  final LoginRepository loginRepository;
  final RegisterRepository registerRepository;
  String? phoneNo;
  String? password;
  AuthenticationViewmodel({
    required this.loginRepository,
    required this.registerRepository,
  });

  final ValueNotifier<AuthState> stateNotifier = ValueNotifier(
    AuthInitialState(),
  );

  Future<AuthState> login() async {
    assert(password != null, 'Password cannot be null');
    assert(phoneNo != null, 'phone no cannot be null');

    stateNotifier.value = AuthProcessingState();
    final result = await loginRepository.login(
      RegisterEntity(password: (password ?? ''), phoneNo: phoneNo ?? ''),
    );

    result.fold(
      ifLeft: (failure) {
        stateNotifier.value = AuthFailureState(message: failure.message);
      },
      ifRight: (data) {
        if (data == null) {
          stateNotifier.value = AuthFailureState();
          return;
        }
        stateNotifier.value = AuthSuccessState(userId: data);
      },
    );
    return stateNotifier.value;
  }

  set storePhoneNo(String no) {
    phoneNo = no;
  }

  set storePassword(String pwd) {
    password = pwd;
  }

  Future<AuthState> createAccount() async {
    stateNotifier.value = AuthProcessingState();
    final result = await registerRepository.createAccount(
      RegisterEntity(
        password: super.hashMetadata(password ?? ''),
        phoneNo: phoneNo ?? '',
      ),
    );

    result.fold(
      ifLeft: (failure) {
        stateNotifier.value = AuthFailureState(message: failure.message);
      },
      ifRight: (data) {
        stateNotifier.value = AuthSuccessState(userId: data);
      },
    );

    return stateNotifier.value;
  }
}

sealed class AuthState {
  const AuthState();
}

final class AuthProcessingState extends AuthState {}

final class AuthInitialState extends AuthState {}

final class AuthSuccessState extends AuthState {
  final String userId;
  const AuthSuccessState({required this.userId});
}

final class AuthFailureState extends AuthState {
  final String message;
  const AuthFailureState({
    this.message = 'Check your credentials and try again!',
  });
}
