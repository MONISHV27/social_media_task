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

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white, //Color(0XFFEEEEEE)
      // resizeToAvoidBottomInset: true,
      body: CustomScrollView(
        // reverse: true,
        slivers: [
          SliverFillRemaining(
            // hasScrollBody: false,
            child: Stack(
              alignment: Alignment.bottomCenter,

              children: [
                Positioned(
                  top: 0.0,
                  child: const AuthHeaderWidget(isRegister: false),
                ),

                MultiProvider(
                  providers: [
                    Provider<LoginRepository>(
                      create: (context) =>
                          LoginRepositoryImpl(service: LoginService()),
                    ),
                    Provider<RegisterRepository>(
                      create: (context) =>
                          RegisterRepositoryImpl(service: RegisterService()),
                    ),
                    Provider(
                      create: (context) => AuthenticationViewmodel(
                        loginRepository: context.read<LoginRepository>(),
                        registerRepository: context.read<RegisterRepository>(),
                      ),
                    ),
                  ],

                  child: const AuthenticationComponenetWidget(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
