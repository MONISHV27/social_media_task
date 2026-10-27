import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/theme/color_themes.dart';
import 'package:social_media/core/utils/dialog_status_helper.dart';
import 'package:social_media/features/posts/view/widgets/post_interaction_widget.dart';
import 'package:social_media/features/posts/view_model/comment_view_model.dart';
import 'package:social_media/features/posts/view_model/like_view_model.dart';

class StoryPlayerInteraction extends StatelessWidget {
  const StoryPlayerInteraction({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsetsGeometry.only(
        bottom: MediaQuery.sizeOf(context).height * 0.1,
        right: MediaQuery.sizeOf(context).width * 0.025,
      ),
      child: Column(
        spacing: 24.0,
        children: [
          Consumer<LikeViewModel>(
            builder: (context, value, child) {
              return Column(
                children: [
                  PostInteractionWidget(
                    onTap: () =>
                        context.read<LikeViewModel>().onLikeInteraction(),
                    color: (context.read<LikeViewModel>().isLike)
                        ? Colors.red
                        : ColorTheme.storyInteractionIconColor,
                    icon: context.read<LikeViewModel>().isLike
                        ? Icons.favorite
                        : Icons.favorite_outline,
                    size: 35,
                  ),
                  Text(
                    (context.read<LikeViewModel>().likes).toString(),
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              );
            },
          ),

          Column(
            children: [
              PostInteractionWidget(
                color: ColorTheme.storyInteractionIconColor,
                onTap: () => DialogStatusHelper.openCommentSheet(context),
                icon: Icons.comment_outlined,

                size: 35,
              ),
              Text(
                (context.watch<CommentViewModel>().comments.length).toString(),
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          Column(
            children: [
              PostInteractionWidget(
                color: ColorTheme.storyInteractionIconColor,
                icon: Icons.share_sharp,
                onTap: () {},
                size: 35,
              ),
              Text(
                'Share',
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
