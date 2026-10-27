import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/widgets/action_button.dart';
import 'package:social_media/features/authentication/login/data/repository/login_repository.dart';
import 'package:social_media/features/authentication/login/data/repository/register_repository.dart';
import 'package:social_media/features/authentication/login/data/repository_impl/login_repository_impl.dart';
import 'package:social_media/features/authentication/login/data/repository_impl/register_repository_impl.dart';
import 'package:social_media/features/authentication/login/data/services/login_service.dart';
import 'package:social_media/features/authentication/login/data/services/register_service.dart';
import 'package:social_media/features/authentication/login/view/widgets/authentication_component_widget.dart';
import 'package:social_media/features/authentication/login/view/widgets/custom_text_field.dart';
import 'package:social_media/features/authentication/login/view_model/authentication_viewmodel.dart';
import 'package:social_media/features/posts/data/services/post_service.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(
          top: MediaQuery.viewInsetsOf(context).top,
          left: 16.0,
          right: 16.0,
        ),
        child: Column(
          spacing: 24.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('Welcome', style: TextStyle(fontSize: 24.0)),
            Text(
              'Welcome, Log in to continue!',
              style: TextStyle(
                color: const Color.fromARGB(255, 131, 129, 130),
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
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
    );
  }
}
