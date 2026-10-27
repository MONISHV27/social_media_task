import 'package:flutter/material.dart';
import 'package:social_media/features/posts/data/entities/post_entity.dart';
import 'package:social_media/features/posts/data/repositories/post_repository.dart';

sealed class PostUIState {
  const PostUIState();
}

final class PostLoadingState extends PostUIState {}

final class PostSuccessState extends PostUIState {
  final List<PostEntity> posts;
  const PostSuccessState({required this.posts});
}

final class PostFailureState extends PostUIState {
  final String message;
  const PostFailureState({required this.message});
}

class PostViewmodel extends ChangeNotifier {
  final PostRepository _repository;
  final String userId;
  PostUIState _currentState = PostLoadingState();

  PostUIState get postState => _currentState;
  PostViewmodel(this._repository, {required this.userId}) {
    loadPosts(userId);
  }

  void loadPosts(String userId) async {
    final result = await _repository.getPosts(userId);
    result.fold(
      ifLeft: (failure) {
        _currentState = PostFailureState(message: failure.message);
        notifyListeners();
      },
      ifRight: (data) {
        _currentState = PostSuccessState(posts: data);
        notifyListeners();
      },
    );
  }
}
