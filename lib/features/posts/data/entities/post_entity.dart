class PostEntity {
  final String id;
  final String name;
  final String? url;
  final int likes;
  final bool isLiked;
  final String? likeId;

  const PostEntity({
    required this.id,
    required this.likeId,
    required this.name,
    required this.url,
    required this.likes,
    required this.isLiked,
  });
}
