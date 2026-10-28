import 'package:flutter/material.dart';

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
        // borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120.0)),
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            // Color(0XFFFFF6B7), Color(0XFFF6416C),
            Color(0XFFEF629A),
            Color(0XFFEECDA1),

            // Color(0XFFF1A7F1),
            // Color(0XFFFAD0C4)
          ],
        ),
      ),

      height: MediaQuery.sizeOf(context).height * 0.4,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
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
        ],
      ),
    );
  }
}
