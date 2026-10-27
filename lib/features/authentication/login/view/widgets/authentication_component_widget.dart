import 'package:flutter/material.dart';
import 'package:social_media/common/widgets/action_button.dart';
import 'package:social_media/core/validators/number_validator.dart';
import 'package:social_media/core/validators/password_validator.dart';
import 'package:social_media/features/authentication/login/view/widgets/custom_text_field.dart';
import 'package:social_media/features/home/view/screens/home_screen.dart';

class AuthenticationComponenetWidget extends StatelessWidget {
  final bool isRegister;
  const AuthenticationComponenetWidget({super.key, this.isRegister = false});

  @override
  Widget build(BuildContext context) {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteractionIfError,
      child: Column(
        spacing: 24.0,
        children: [
          CustomTextField(
            validator: NumberValidator(isRequired: true, min: 10, max: 10),
            label: 'Phone no',
            keyboardType: TextInputType.number,
          ),
          CustomTextField(
            validator: PasswordValidator(true),
            label: 'Password',
          ),
          Builder(
            builder: (context) {
              return ActionButton(
                onTap: () async {
                  FocusManager.instance.primaryFocus?.unfocus();
                  Form.of(context).validate();

                  if (isRegister) {
                    // if (isSuccess) {
                    //   if (!context.mounted) return;
                    //   Navigator.push(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => HomeScreen()),
                    //   );
                    // }
                  } else {
                    final bool isSuccess = true;
                    // await context
                    //     .read<AuthenticationViewmodel>()
                    //     .login();
                    if (isSuccess) {
                      if (!context.mounted) return;
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => HomeScreen()),
                      );
                    }
                  }
                },
                label: isRegister ? 'Register' : 'Login',
              );
            },
          ),
        ],
      ),
    );
  }
}
