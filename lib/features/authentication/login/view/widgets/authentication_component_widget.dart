import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/constants/size_constants.dart';
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
      child: SizedBox(
        height:
            MediaQuery.sizeOf(context).height * SizeConstants.authContentSize,

        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(24.0),
              topRight: Radius.circular(24.0),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children:
                  [
                        const SizedBox(
                          height: SpacingConstants.authTextFieldGap * 2,
                        ),

                        CustomTextField(
                          prefixIcon: Icons.phone,
                          onSave: (value) =>
                              context
                                      .read<AuthenticationViewmodel>()
                                      .storePhoneNo =
                                  value ?? '',

                          validator: const NumberValidator(
                            isRequired: true,
                            min: 10,
                            max: 10,
                          ),
                          label: 'Phone no',
                          keyboardType: TextInputType.number,
                        ),
                        const SizedBox(
                          height: SpacingConstants.authTextFieldGap,
                        ),
                        CustomTextField(
                          prefixIcon: Icons.lock_open_outlined,
                          onSave: (value) =>
                              context
                                      .read<AuthenticationViewmodel>()
                                      .storePassword =
                                  value ?? '',
                          validator: const PasswordValidator(true),
                          label: 'Password',
                        ),
                        const SizedBox(
                          height: SpacingConstants.authTextFieldGap * 2,
                        ),

                        Column(
                          spacing: 16.0,
                          children: [
                            Builder(
                              builder: (context) {
                                return GestureDetector(
                                  onTap: () async {
                                    if (context
                                            .read<AuthenticationViewmodel>()
                                            .stateNotifier
                                            .value
                                        is AuthProcessingState) {
                                      return;
                                    }
                                    FocusManager.instance.primaryFocus
                                        ?.unfocus();
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
                                  child: ValueListenableBuilder(
                                    valueListenable: context
                                        .read<AuthenticationViewmodel>()
                                        .stateNotifier,
                                    builder: (context, value, child) {
                                      return ActionGradientButton(
                                        isLoading:
                                            (value is AuthProcessingState),
                                        label: isRegister
                                            ? 'Register'
                                            : 'Login',
                                      );
                                    },
                                  ),
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
                                  onTap: () => _navigateToAuthScreen(
                                    isRegister,
                                    context,
                                  ),
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
                      ]
                      .animate(interval: 150.ms)
                      .fade(duration: 400.ms, curve: Curves.easeIn),
            ),
          ),
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
