import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/theme/color_themes.dart';
import 'package:social_media/common/widgets/user_circular_avatar_widget.dart';
import 'package:social_media/core/user_manager/current_user_provider.dart';
import 'package:social_media/core/utils/dialog_status_helper.dart';
import 'package:social_media/features/posts/data/entities/post_entity.dart';
import 'package:social_media/features/posts/data/repositories/comment_repository.dart';
import 'package:social_media/features/posts/data/repositories/post_like_repository.dart';
import 'package:social_media/features/posts/data/repository_impl/comment_repository_impl.dart';
import 'package:social_media/features/posts/data/repository_impl/post_like_repository_impl.dart';
import 'package:social_media/features/posts/data/services/comment_service.dart';
import 'package:social_media/features/posts/data/services/post_like_service.dart';
import 'package:social_media/features/posts/view/widgets/post_interaction_widget.dart';
import 'package:social_media/features/posts/view_model/comment_view_model.dart';
import 'package:social_media/features/posts/view_model/like_view_model.dart';
import 'package:social_media/features/posts/view_model/post_viewmodel.dart';

class PostWidget extends StatelessWidget {
  final PostEntity postInfo;
  const PostWidget({super.key, required this.postInfo});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        border: Border(top: BorderSide(color: ColorTheme.borderColor)),
      ),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 14.0,
              vertical: 10.0,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 8.0,

                  children: [
                    const UserCircularAvatar(radius: 20.0, imgUrl: null),
                    Text(
                      postInfo.name,
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16.0,
                      ),
                    ),
                  ],
                ),

                InkWell(
                  onTap: () => context.read<PostViewmodel>().loadPosts(
                    context.read<CurrentUser>().userId,
                  ),
                  child: const Icon(
                    Icons.more_vert_outlined,
                    color: Color.fromARGB(221, 48, 48, 48),
                  ),
                ),
              ],
            ),
          ),
          AspectRatio(
            aspectRatio: 1.0,
            child: SizedBox(
              child: Image.asset(
                width: double.infinity,
                fit: BoxFit.fill,
                (postInfo.url != null
                    ? 'assets/images/${postInfo.url}'
                    : 'assets/images/img_01.png'),
              ),
            ),
          ),
          Container(
            constraints: const BoxConstraints(minHeight: 60),
            padding: const EdgeInsets.symmetric(
              horizontal: 10.0,
              vertical: 10.0,
            ),

            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 12.0,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    MultiProvider(
                      providers: [
                        Provider<PostLikeRepository>(
                          create: (_) => PostLikeRepositoryImpl(
                            service: PostLikeService(),
                          ),
                        ),
                        ChangeNotifierProvider(
                          create: (context) => LikeViewModel(
                            userId: context.read<CurrentUser>().userId,
                            postId: postInfo.id,
                            id: postInfo.likeId,
                            isLike: postInfo.isLiked,
                            likes: postInfo.likes,
                            repository: context.read<PostLikeRepository>(),
                          ),
                        ),
                      ],
                      child: Consumer<LikeViewModel>(
                        builder: (context, value, child) {
                          return Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            spacing: 4.0,
                            children: [
                              PostInteractionWidget(
                                onTap: () => context
                                    .read<LikeViewModel>()
                                    .onLikeInteraction(),
                                color: (context.read<LikeViewModel>().isLike)
                                    ? Colors.red
                                    : null,
                                icon: context.read<LikeViewModel>().isLike
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                              ),
                              // if (context.read<LikeViewModel>().likes != 0)
                              Text(
                                'Likes ${(context.read<LikeViewModel>().likes == 0 ? '' : context.read<LikeViewModel>().likes)}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    MultiProvider(
                      providers: [
                        Provider<CommentRepository>(
                          create: (context) =>
                              CommentRepositoryImpl(service: CommentService()),
                        ),
                        ChangeNotifierProvider(
                          create: (context) => CommentViewModel(
                            comments: postInfo.comments,
                            postId: postInfo.id,
                            userName: context.read<CurrentUser>().userName,
                            repository: context.read<CommentRepository>(),
                          ),
                        ),
                      ],
                      child: Builder(
                        builder: (context) {
                          return Column(
                            spacing: 4.0,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                spacing: 4.0,
                                children: [
                                  PostInteractionWidget(
                                    onTap: () =>
                                        DialogStatusHelper.openCommentSheet(
                                          context,
                                        ),
                                    icon: Icons.comment_outlined,
                                  ),
                                  Text(
                                    '${(context.watch<CommentViewModel>().comments.length)}',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                              const Text(
                                'Comment',
                                style: TextStyle(fontWeight: FontWeight.bold),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                  ],
                ),
                PostInteractionWidget(
                  onTap: () =>
                      context.read<LikeViewModel>().onLikeInteraction(),
                  icon: Icons.bookmark_border_outlined,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
