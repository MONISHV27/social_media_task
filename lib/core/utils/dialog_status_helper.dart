import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/features/posts/view/widgets/comment_bottom_sheet.dart';
import 'package:social_media/features/posts/view_model/comment_view_model.dart';

class DialogStatusHelper {
  static void showSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Row(
          children: [
            Expanded(child: Text(style: TextStyle(), message, softWrap: true)),
          ],
        ),
        backgroundColor: Colors.teal,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(12.0),
          ), // Adds rounded edges
        ),
        margin: const EdgeInsets.all(16),
        elevation: 6, // Controls shadow depth
      ),
    );
  }

  static Future<void> openCommentSheet(BuildContext screenContext) async {
    await showModalBottomSheet(
      isScrollControlled: true,
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadiusGeometry.only(
          topLeft: Radius.circular(12.0),
          topRight: Radius.circular(12.0),
        ),
      ),
      context: screenContext,
      builder: (context) {
        return Padding(
          padding: EdgeInsetsGeometry.only(
            bottom: MediaQuery.of(context).viewInsets.bottom,
          ),
          child: MultiProvider(
            providers: [
              ChangeNotifierProvider.value(
                value: screenContext.read<CommentViewModel>(),
              ),
            ],
            child: const CommentBottomSheet(),
          ),
        );
      },
    );
  }
}
