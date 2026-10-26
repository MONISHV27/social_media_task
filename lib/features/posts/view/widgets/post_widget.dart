import 'package:flutter/material.dart';
import 'package:social_media/common/widgets/user_circular_avatar_widget.dart';
import 'package:social_media/features/posts/view/widgets/post_interaction_widget.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 8.0,

                  children: [
                    const UserCircularAvatar(radius: 20.0),
                    Text(
                      'User',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),

                InkWell(
                  child: Icon(
                    Icons.more_vert_outlined,
                    color: const Color.fromARGB(221, 48, 48, 48),
                  ),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1.0,
            child: SizedBox(
              child: Image.network(
                width: double.infinity,
                fit: BoxFit.fill,
                'https://picsum.photos/250?image=9',
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),

            child: Row(
              spacing: 12.0,
              children: [
                const PostInteractionWidget(icon: Icons.favorite_outline),
                const PostInteractionWidget(icon: Icons.comment),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
