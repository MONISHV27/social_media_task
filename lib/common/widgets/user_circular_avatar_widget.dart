import 'package:flutter/material.dart';

class UserCircularAvatar extends StatelessWidget {
  final double radius;
  const UserCircularAvatar({super.key, required this.radius});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 243, 78, 133),
          width: 1.5,
        ),
        shape: BoxShape.circle,
        // color: Colors.red,
      ),
      child: SizedBox(
        height: radius * 2,
        width: radius * 2,
        child: Icon(Icons.person),
      ),
    );
  }
}
