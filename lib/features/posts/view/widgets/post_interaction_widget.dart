import 'package:flutter/material.dart';

class PostInteractionWidget extends StatelessWidget {
  final IconData icon;
  final Color? color;
  final VoidCallback onTap;
  final double? size;

  const PostInteractionWidget({
    super.key,
    required this.icon,
    this.color,
    required this.onTap,
    this.size,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(50.0),

        onTap: onTap,
        child: Padding(
          padding: EdgeInsetsGeometry.all(8.0),
          child: Icon(
            icon,
            color: color ?? const Color.fromARGB(221, 48, 48, 48),
            size: size,
          ),
        ),
      ),
    );
  }
}
