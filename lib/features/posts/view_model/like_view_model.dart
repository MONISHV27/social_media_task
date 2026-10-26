import 'package:flutter/foundation.dart';
import 'package:social_media/features/posts/data/repositories/post_like_repository.dart';

class LikeViewModel extends ChangeNotifier {
  bool isLike;
  int likes;
  String? id;
  String postId;
  final String userId;
  final PostLikeRepository _repository;
  LikeViewModel({
    required this.isLike,
    required this.likes,
    required this._repository,
    required this.id,
    required this.postId,
    required this.userId,
  });

  Future<void> _onLikePost() async {
    final result = await _repository.likePost(postId: postId, userId: userId);

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
    final result = await _repository.unLikePost(
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
    if (isLike) {
      await _disLikePost();
    } else {
      await _onLikePost();
    }
    notifyListeners();
  }
}
