import 'package:flutter/material.dart';
import 'package:social_media/features/authentication/login/view/screens/login_screen.dart';
import 'package:social_media/features/authentication/login/view/widgets/authentication_component_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          spacing: 24.0,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text('Welcome', style: TextStyle(fontSize: 24.0)),
            Text(
              'Welcome, Create a Account to continue!',
              style: TextStyle(
                color: const Color.fromARGB(255, 131, 129, 130),
                fontSize: 18.0,
                fontWeight: FontWeight.w500,
                fontStyle: FontStyle.italic,
              ),
            ),

            const AuthenticationComponenetWidget(),
          ],
        ),
      ),
    );
  }
}
