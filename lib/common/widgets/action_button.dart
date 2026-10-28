import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ActionButton extends StatelessWidget {
  final VoidCallback onTap;
  final String label;
  final Color color;
  const ActionButton({
    super.key,
    required this.onTap,
    required this.label,
    this.color = const Color.fromARGB(255, 247, 160, 30),
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: color),
              onPressed: onTap,
              child: Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ActionGradientButton extends StatelessWidget {
  final String label;
  final Color color;
  final bool isLoading;
  const ActionGradientButton({
    super.key,
    required this.label,
    this.color = const Color.fromARGB(255, 247, 160, 30),
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: DecoratedBox(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(25.0),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              // Color(0XFFFFF6B7), Color(0XFFF6416C),
              ////
              // Color(0XFFEF629A),
              // Color(0XFFEECDA1),
              // Color(0XFFF1A7F1),
              // Color(0XFFFAD0C4),
              Color(0xFFFF5F6D), Color(0XFFFFc371),
            ],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,

          children: [
            if (isLoading)
              const SpinKitFadingCircle(color: Colors.white, size: 40),

            if (!isLoading)
              Text(
                label,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
