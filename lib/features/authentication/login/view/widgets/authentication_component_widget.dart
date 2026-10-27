import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/widgets/action_button.dart';
import 'package:social_media/core/user_manager/current_user_provider.dart';
import 'package:social_media/core/utils/dialog_status_helper.dart';
import 'package:social_media/core/validators/number_validator.dart';
import 'package:social_media/core/validators/password_validator.dart';
import 'package:social_media/features/authentication/login/view/screens/login_screen.dart';
import 'package:social_media/features/authentication/login/view/screens/register_screen.dart';
import 'package:social_media/features/authentication/login/view/widgets/custom_text_field.dart';
import 'package:social_media/features/authentication/login/view_model/authentication_viewmodel.dart';
import 'package:social_media/features/home/view/screens/home_screen.dart';

class AuthenticationComponenetWidget extends StatelessWidget {
  final bool isRegister;
  const AuthenticationComponenetWidget({super.key, this.isRegister = false});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteractionIfError,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        spacing: 24.0,
        children: [
          CustomTextField(
            onSave: (value) =>
                context.read<AuthenticationViewmodel>().storePhoneNo =
                    value ?? '',

            validator: NumberValidator(isRequired: true, min: 10, max: 10),
            label: 'Phone no',
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            onSave: (value) =>
                context.read<AuthenticationViewmodel>().storePassword =
                    value ?? '',
            validator: PasswordValidator(true),
            label: 'Password',
          ),
          Builder(
            builder: (context) {
              return Stack(
                alignment: Alignment.centerRight,
                children: [
                  ActionButton(
                    onTap: () async {
                      if (context
                              .read<AuthenticationViewmodel>()
                              .stateNotifier
                              .value
                          is AuthProcessingState) {
                        return;
                      }
                      FocusManager.instance.primaryFocus?.unfocus();
                      if (Form.of(context).validate()) {
                        Form.of(context).save();
                        if (isRegister) {
                          final AuthState state = await context
                              .read<AuthenticationViewmodel>()
                              .createAccount();
                          if (!context.mounted) return;

                          if (state is AuthSuccessState) {
                            _navigateHome(context, state.userId);
                          }
                          if (state is AuthFailureState) {
                            DialogStatusHelper.showSnackBar(
                              context,
                              state.message,
                            );
                          }
                        } else {
                          final AuthState state = await context
                              .read<AuthenticationViewmodel>()
                              .login();
                          if (!context.mounted) return;

                          if (state is AuthSuccessState) {
                            _navigateHome(context, state.userId);
                          }
                          if (state is AuthFailureState) {
                            DialogStatusHelper.showSnackBar(
                              context,
                              state.message,
                            );
                          }
                        }
                      }
                    },
                    label: isRegister ? 'Register' : 'Login',
                  ),

                  ValueListenableBuilder(
                    valueListenable: context
                        .read<AuthenticationViewmodel>()
                        .stateNotifier,
                    builder: (context, value, child) {
                      return (value is AuthProcessingState)
                          ? Positioned(
                              right: 16.0,
                              child: SizedBox(
                                height: 20.0,
                                width: 20.0,
                                child: const CircularProgressIndicator(
                                  color: Colors.white,
                                ),
                              ),
                            )
                          : const SizedBox.shrink();
                    },
                  ),
                ],
              );
            },
          ),

          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>
                      isRegister ? const LoginScreen() : const RegisterScreen(),
                ),
              );
            },
            child: Text(
              'Click to ${isRegister ? 'Login' : 'Register'}',
              style: TextStyle(
                fontStyle: FontStyle.italic,
                decoration: TextDecoration.underline,
                decorationColor: const Color.fromARGB(255, 238, 117, 157),
                color: const Color.fromARGB(255, 238, 117, 157),
                fontWeight: FontWeight.w500,
                fontSize: 16.0,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _navigateHome(BuildContext context, String userId) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Provider(
          create: (_) => CurrentUser(userId: userId),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
