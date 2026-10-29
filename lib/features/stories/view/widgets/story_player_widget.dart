import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:social_media/core/user_manager/current_user_provider.dart';
import 'package:social_media/features/posts/data/repositories/comment_repository.dart';
import 'package:social_media/features/posts/data/repositories/post_like_repository.dart';
import 'package:social_media/features/posts/data/repository_impl/comment_repository_impl.dart';
import 'package:social_media/features/posts/data/repository_impl/post_like_repository_impl.dart';
import 'package:social_media/features/posts/view_model/comment_view_model.dart';
import 'package:social_media/features/posts/view_model/like_view_model.dart';
import 'package:social_media/features/stories/data/entities/story_entity.dart';
import 'package:social_media/features/stories/data/services/story_comment_service.dart';
import 'package:social_media/features/stories/data/services/story_like_service.dart';
import 'package:social_media/features/stories/view/widgets/story_intercation_widget.dart';
import 'package:social_media/features/stories/view_model/story_player_state_notifier.dart';
import 'package:video_player/video_player.dart';

class StoryPlayerWidget extends StatefulWidget {
  final String path;
  const StoryPlayerWidget({super.key, required this.path});

  @override
  State<StoryPlayerWidget> createState() => _StoryPlayerWidgetState();
}

class _StoryPlayerWidgetState extends State<StoryPlayerWidget> {
  late VideoPlayerController _playerController;
  late StoryPlayerStateNotifier<StoryPlayerState> _notifier;
  @override
  void initState() {
    super.initState();
    _notifier = StoryPlayerStateNotifier(StoryLoadingState());
    _playerController = VideoPlayerController.asset(widget.path)
      ..initialize()
          .then((_) {
            debugPrint('--------------------initialized');
            _notifier.value = StoryPlayingState();

            _playerController.play();
          })
          .onError((err, test) {
            _notifier.value = StoryPlayErrorState();

            debugPrint('---------------------Error occured');
          });
  }

  @override
  void dispose() {
    _playerController.dispose();
    _notifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        AspectRatio(aspectRatio: 9 / 16, child: VideoPlayer(_playerController)),
        Positioned(
          top: MediaQuery.sizeOf(context).height * 0.05,
          left: MediaQuery.sizeOf(context).width * 0.05,
          child: InkWell(
            onTap: () => Navigator.pop(context),
            child: const Icon(Icons.arrow_back, color: Colors.white, size: 25),
          ),
        ),
        Positioned(
          bottom: 0.0,
          right: 0.0,
          child: MultiProvider(
            providers: [
              Provider<PostLikeRepository>(
                create: (_) =>
                    const PostLikeRepositoryImpl(service: StorysLikeService()),
              ),
              ChangeNotifierProvider(
                create: (context) => LikeViewModel(
                  userId: context.read<CurrentUser>().userId,
                  postId: context.read<StoryEntity>().id,
                  id: context.read<StoryEntity>().likeId,
                  isLike: context.read<StoryEntity>().isLiked,
                  likes: context.read<StoryEntity>().likes,
                  repository: context.read<PostLikeRepository>(),
                ),
              ),

              Provider<CommentRepository>(
                create: (context) =>
                    const CommentRepositoryImpl(service: StoryCommentService()),
              ),
              ChangeNotifierProvider(
                create: (context) => CommentViewModel(
                  comments: context.read<StoryEntity>().comments,
                  postId: context.read<StoryEntity>().id,
                  userName: context.read<CurrentUser>().userName,
                  repository: context.read<CommentRepository>(),
                ),
              ),
            ],
            child: const StoryPlayerInteraction(),
          ),
        ),

        Positioned(
          child: ValueListenableBuilder<StoryPlayerState>(
            valueListenable: _notifier,
            builder: (context, value, child) => switch (value) {
              StoryLoadingState() => const SpinKitFadingCircle(
                color: Color(0xFFDDDDDD),
              ),
              StoryPlayErrorState() => const Text(
                'Unable to load story!',
                style: TextStyle(color: Colors.white),
              ),
              _ => const SizedBox.shrink(),
            },
          ),
        ),
      ],
    );
  }
}
