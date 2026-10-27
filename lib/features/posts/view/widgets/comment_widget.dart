import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
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
            const CircleAvatar(
              radius: 12.0,
              backgroundColor: Color.fromARGB(255, 236, 235, 235),
              child: Icon(Icons.person),
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
