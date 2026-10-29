import 'package:flutter/material.dart';

class CustomSlideFadeTransitionsBuilder extends PageTransitionsBuilder {
  const CustomSlideFadeTransitionsBuilder();

  @override
  Duration get transitionDuration => const Duration(milliseconds: 200);

  @override
  Widget buildTransitions<T>(
    PageRoute<T> route,
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    const begin = Offset(1.0, 0.0);
    const end = Offset.zero;
    const curve = Curves.easeInOutCubic;

    var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
    var offsetAnimation = animation.drive(tween);

    return FadeTransition(
      opacity: animation, // Fade the screen
      child: SlideTransition(
        position: offsetAnimation, // Slide the screen
        child: child,
      ),
    );
  }
}
