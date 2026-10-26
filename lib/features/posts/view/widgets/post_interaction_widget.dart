import 'package:flutter/material.dart';

class PostInteractionWidget extends StatelessWidget {
  final IconData icon;

  const PostInteractionWidget({super.key, required this.icon});

  @override
  Widget build(BuildContext context) {
    return Icon(icon, color: const Color.fromARGB(221, 48, 48, 48));
  }
}
