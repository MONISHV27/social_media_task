import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:social_media/common/widgets/user_circular_avatar_widget.dart';
import 'package:social_media/core/user_manager/current_user_provider.dart';
import 'package:social_media/features/posts/data/entities/post_entity.dart';
import 'package:social_media/features/posts/data/repositories/post_like_repository.dart';
import 'package:social_media/features/posts/data/repository_impl/post_like_repository_impl.dart';
import 'package:social_media/features/posts/data/services/post_like_service.dart';
import 'package:social_media/features/posts/view/widgets/post_interaction_widget.dart';
import 'package:social_media/features/posts/view_model/like_view_model.dart';
import 'package:social_media/features/posts/view_model/post_viewmodel.dart';

class PostWidget extends StatelessWidget {
  final PostEntity postInfo;
  const PostWidget({super.key, required this.postInfo});

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: Border(top: BorderSide(color: Color(0xFFE2E8F0))),
      ),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(horizontal: 14.0, vertical: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  spacing: 8.0,

                  children: [
                    const UserCircularAvatar(radius: 20.0),
                    Text(
                      postInfo.name,
                      style: TextStyle(
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
            constraints: BoxConstraints(minHeight: 60),
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
                          return Row(
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

                              Text(
                                (context.read<LikeViewModel>().likes)
                                    .toString(),
                              ),
                            ],
                          );
                        },
                      ),
                    ),
                    PostInteractionWidget(
                      onTap: () =>
                          context.read<LikeViewModel>().onLikeInteraction(),
                      icon: Icons.comment_outlined,
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
