import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/theme/color_themes.dart';
import 'package:social_media/features/posts/data/entities/comment_entity.dart';

class CommentWidget extends StatelessWidget {
  const CommentWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          spacing: 12.0,
          children: [
            Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(50.0)),

                side: BorderSide(color: Color(0xFFDDDDDD)),
              ),
              child: const CircleAvatar(
                radius: 13.0,
                backgroundColor: Color(0xFFfdfcfb),
                child: Icon(
                  Icons.person,
                  size: 16.0,
                  color: ColorTheme.iconSecondary,
                ),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  context.read<CommentEntity>().commentedBy,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(context.read<CommentEntity>().comment),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
