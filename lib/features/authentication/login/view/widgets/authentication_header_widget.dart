import 'package:flutter/material.dart';
import 'package:social_media/common/constants/size_constants.dart';
import 'package:social_media/common/theme/color_themes.dart';

class AuthHeaderWidget extends StatelessWidget {
  final bool isRegister;
  const AuthHeaderWidget({super.key, required this.isRegister});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
        gradient: ColorTheme.authHeaderColor,
      ),

      height: MediaQuery.sizeOf(context).height * SizeConstants.authHeaderSize,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Text(
            isRegister ? 'Sign up' : 'Sign in',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFf0f0f0),
              fontSize: 42.0,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            isRegister
                ? 'Create your account, to continue'
                : 'Sign in to your Account to continue.',
            textAlign: TextAlign.center,
            style: TextStyle(color: Color(0XFFe0eafa), fontSize: 16.0),
          ),
          SizedBox(height: 32.0),
          SizedBox(
            height:
                MediaQuery.sizeOf(context).height *
                ((SizeConstants.authContentSize +
                        SizeConstants.authHeaderSize) -
                    1),
          ),
        ],
      ),
    );
  }
}
