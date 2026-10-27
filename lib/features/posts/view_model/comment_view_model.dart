import 'package:flutter/material.dart';
import 'package:social_media/features/posts/data/entities/comment_entity.dart';
import 'package:social_media/features/posts/data/entities/comment_params_entity.dart';
import 'package:social_media/features/posts/data/repositories/comment_repository.dart';

sealed class CommentState {}

final class CommentProcessingState extends CommentState {}

final class CommentInitialState extends CommentState {}

class CommentViewModel extends ChangeNotifier {
  final CommentRepository repository;
  final String postId;
  final String userName;
  CommentState state = CommentInitialState();
  CommentViewModel({
    required this.repository,
    required this.postId,
    required this.userName,
    required this.comments,
  });
  List<CommentEntity> comments = [];

  Future<void> addComment(String message) async {
    state = CommentProcessingState();
    final result = await repository.uploadComment(
      CommentParamsEntity(comment: message, postId: postId, userName: userName),
    );

    result.fold(
      ifLeft: (failure) {},
      ifRight: (value) {
        comments.add(value);
        state = CommentInitialState();

        notifyListeners();
      },
    );
  }
}
