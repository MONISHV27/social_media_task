import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/features/authentication/login/data/repository/login_repository.dart';
import 'package:social_media/features/authentication/login/data/repository/register_repository.dart';
import 'package:social_media/features/authentication/login/data/repository_impl/login_repository_impl.dart';
import 'package:social_media/features/authentication/login/data/repository_impl/register_repository_impl.dart';
import 'package:social_media/features/authentication/login/data/services/login_service.dart';
import 'package:social_media/features/authentication/login/data/services/register_service.dart';
import 'package:social_media/features/authentication/login/view/widgets/authentication_component_widget.dart';
import 'package:social_media/features/authentication/login/view/widgets/authentication_header_widget.dart';
import 'package:social_media/features/authentication/login/view_model/authentication_viewmodel.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      body: CustomScrollView(
        reverse: true,
        slivers: [
          SliverFillRemaining(
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Positioned(
                  top: 0.0,
                  child: const AuthHeaderWidget(isRegister: true),
                ),

                MultiProvider(
                  providers: [
                    Provider<LoginRepository>(
                      create: (context) =>
                          const LoginRepositoryImpl(service: LoginService()),
                    ),
                    Provider<RegisterRepository>(
                      create: (context) => const RegisterRepositoryImpl(
                        service: RegisterService(),
                      ),
                    ),
                    Provider(
                      create: (context) => AuthenticationViewmodel(
                        loginRepository: context.read<LoginRepository>(),
                        registerRepository: context.read<RegisterRepository>(),
                      ),
                    ),
                  ],
                  child: DecoratedBox(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(24.0),
                        topRight: Radius.circular(24.0),
                      ),
                    ),
                    child: const AuthenticationComponenetWidget(
                      isRegister: true,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
