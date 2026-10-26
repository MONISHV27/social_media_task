import 'package:social_media/features/posts/data/repositories/post_repository.dart';
import 'package:social_media/features/posts/data/services/post_service.dart';

class PostRepositoryImpl implements PostRepository {
  final PostService service;
  const PostRepositoryImpl({required this.service});
  @override
  Future<void> getPosts() async {
    service.getPost();
  }
}
