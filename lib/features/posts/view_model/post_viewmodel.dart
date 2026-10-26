import 'package:flutter/material.dart';
import 'package:social_media/features/posts/data/repositories/post_repository.dart';

class PostViewmodel extends ChangeNotifier {
  final PostRepository _repository;

  PostViewmodel(this._repository);
}
