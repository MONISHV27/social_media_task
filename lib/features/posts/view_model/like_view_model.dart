import 'package:flutter/foundation.dart';
import 'package:social_media/features/posts/data/repositories/post_like_repository.dart';

sealed class PostInteractionState {}

final class PostInteractionProcessingState extends PostInteractionState {}

final class PostInteractionInitialState extends PostInteractionState {}

class LikeViewModel extends ChangeNotifier {
  bool isLike;
  int likes;
  String? id;
  String postId;
  final String userId;
  final PostLikeRepository repository;
  PostInteractionState _currentUiState = PostInteractionInitialState();

  PostInteractionState get uiState => _currentUiState;
  LikeViewModel({
    required this.isLike,
    required this.likes,
    required this.repository,
    required this.id,
    required this.postId,
    required this.userId,
  });

  Future<void> _onLikePost() async {
    _currentUiState = PostInteractionProcessingState();
    final result = await repository.likePost(postId: postId, userId: userId);

    result.fold(
      ifLeft: (failure) {},
      ifRight: (data) {
        id = data;
        isLike = true;
        likes++;
      },
    );
  }

  Future<void> _disLikePost() async {
    final result = await repository.unLikePost(
      likeId: id ?? '',
      postId: postId,
    );

    result.fold(
      ifLeft: (failure) {},
      ifRight: (data) {
        id = '';
        isLike = false;
        likes--;
      },
    );
  }

  Future<void> onLikeInteraction() async {
    if (_currentUiState == PostInteractionProcessingState()) {
      return;
    }
    _currentUiState = PostInteractionProcessingState();

    if (isLike) {
      await _disLikePost();
    } else {
      await _onLikePost();
    }
    _currentUiState = PostInteractionInitialState();

    notifyListeners();
  }
}
