import 'package:flutter/material.dart';

class AuthHeaderWidget extends StatelessWidget {
  const AuthHeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.1),
            offset: const Offset(0, 4),
            blurRadius: 10,
            spreadRadius: 1,
          ),
        ],
        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(120.0)),
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
      height: MediaQuery.sizeOf(context).height * 0.35,
    );
  }
}
