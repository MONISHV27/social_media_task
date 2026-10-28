import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/constants/spacing_constants.dart';
import 'package:social_media/common/theme/color_themes.dart';
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            CustomTextField(
              onSave: (value) =>
                  context.read<AuthenticationViewmodel>().storePhoneNo =
                      value ?? '',

              validator: const NumberValidator(
                isRequired: true,
                min: 10,
                max: 10,
              ),
              label: 'Phone no',
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: SpacingConstants.authTextFieldGap),
            CustomTextField(
              onSave: (value) =>
                  context.read<AuthenticationViewmodel>().storePassword =
                      value ?? '',
              validator: const PasswordValidator(true),
              label: 'Password',
            ),
            const SizedBox(height: SpacingConstants.authTextFieldGap * 2),

            Column(
              spacing: 16.0,
              children: [
                Builder(
                  builder: (context) {
                    return Stack(
                      alignment: Alignment.centerRight,
                      children: [
                        ActionGradientButton(
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
                                    child: const SizedBox(
                                      height: 20.0,
                                      width: 20.0,
                                      child: CircularProgressIndicator(
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

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  spacing: 8.0,
                  children: [
                    Text(
                      (isRegister)
                          ? 'Already have an account?'
                          : 'Don\'t have an account?',
                      style: const TextStyle(
                        fontStyle: FontStyle.italic,
                        color: ColorTheme.textFieldLabelColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0,
                      ),
                    ),

                    GestureDetector(
                      onTap: () => _navigateToAuthScreen(isRegister, context),
                      child: Text(
                        (isRegister) ? 'Log in' : 'Sign in',
                        style: const TextStyle(
                          decoration: TextDecoration.underline,
                          decorationColor: Color(0xFFFF5F6D),
                          color: Color(0xFFFF5F6D),
                          fontWeight: FontWeight.w500,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                    // ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAuthScreen(bool isRegister, BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) =>
            isRegister ? const LoginScreen() : const RegisterScreen(),
      ),
    );
  }

  void _navigateHome(BuildContext context, String userId) {
    final random = Random().nextInt(999);

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => Provider(
          create: (_) => CurrentUser(userId: userId, userName: 'user$random'),
          child: const HomeScreen(),
        ),
      ),
    );
  }
}
