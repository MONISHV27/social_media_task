import 'package:flutter/material.dart';

class PostInteractionWidget extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;

  const PostInteractionWidget({
    super.key,
    required this.icon,
    this.color,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Icon(icon, color: color ?? const Color.fromARGB(221, 48, 48, 48)),
    );
  }
}
