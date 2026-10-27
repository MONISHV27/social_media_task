import 'package:flutter/material.dart';

class DialogStatusHelper {
  static void showSnackBar(BuildContext context, String message) {
    // hideExist();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            // const Icon(Icons, color: Colors.white),
            // const SizedBox(width: 8),
            Expanded(child: Text(style: TextStyle(), message, softWrap: true)),
          ],
        ),
        backgroundColor: Colors.teal,
        behavior:
            SnackBarBehavior.floating, // Makes it float above the bottom edge
        duration: const Duration(seconds: 2), // Controls visibility time
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ), // Adds rounded edges
        ),
        margin: const EdgeInsets.all(
          16,
        ), // Margin (only works with floating behavior)
        elevation: 6, // Controls shadow depth
      ),
    );
  }
}

// class SnackbarOverlay extends StatelessWidget {
//   const SnackbarOverlay({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return SnackBar(
//       content: Row(
//         children: [
//           const Icon(Icons.check_circle, color: Colors.white),
//           const SizedBox(width: 8),
//           Expanded(child: Text(style: TextStyle(), message, softWrap: true)),
//         ],
//       ),
//       backgroundColor: Colors.teal,
//       behavior:
//           SnackBarBehavior.floating, // Makes it float above the bottom edge
//       duration: const Duration(seconds: 2), // Controls visibility time
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.all(
//           Radius.circular(12.0),
//         ), // Adds rounded edges
//       ),
//       margin: const EdgeInsets.all(
//         16,
//       ), // Margin (only works with floating behavior)
//       elevation: 6, // Controls shadow depth
//     );
//   }
// }
