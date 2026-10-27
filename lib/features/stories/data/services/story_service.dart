import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/features/stories/data/models/story_model.dart';

class StoryService {
  const StoryService();
  Future<List<StoryModel>> getStories(String userId) async {
    final List<StoryModel> stories = [];
    final data = await FirebaseFirestore.instance.collection('stories').get();
    for (var doc in data.docs) {
      final Map<String, dynamic> storyInfo = {};
      final postDocRec = doc.data();
      storyInfo['id'] = doc.id;
      storyInfo.addAll(postDocRec);

      final likeCollectionRef = FirebaseFirestore.instance
          .collection('stories')
          .doc(doc.id)
          .collection('likes');

      final commentCollectionRef = FirebaseFirestore.instance
          .collection('stories')
          .doc(doc.id)
          .collection('comments');

      // Like Collection  doc reference manipulation
      final int likeNos = (await likeCollectionRef.count().get()).count ?? 0;
      final likedDocRec = await likeCollectionRef
          .where('liked_by', isEqualTo: userId)
          .limit(1)
          .get();

      final bool isExist = likedDocRec.docs.isNotEmpty;
      storyInfo.addAll({
        'like_id': likedDocRec.docs.isNotEmpty
            ? likedDocRec.docs.first.id
            : null,
        'likes': likeNos,
        'isLiked': isExist ? 1 : 0,
      });
      // Comment Collection  doc reference manipulation

      final comments = (await commentCollectionRef.get()).docs
          .map((e) => (e.data()))
          .toList();
      storyInfo.addAll({'comments': comments});
      stories.add(StoryModel.fromJson(storyInfo));
    }
    return stories;
  }

  Future<StoryModel> getStory(String userId, String storyId) async {
    final Map<String, dynamic> storyInfo = {};

    storyInfo['id'] = storyId;

    final likeCollectionRef = FirebaseFirestore.instance
        .collection('stories')
        .doc(storyId)
        .collection('likes');

    final commentCollectionRef = FirebaseFirestore.instance
        .collection('stories')
        .doc(storyId)
        .collection('comments');

    // Like Collection  doc reference manipulation
    final int likeNos = (await likeCollectionRef.count().get()).count ?? 0;
    final likedDocRec = await likeCollectionRef
        .where('liked_by', isEqualTo: userId)
        .limit(1)
        .get();

    final bool isExist = likedDocRec.docs.isNotEmpty;
    storyInfo.addAll({
      'like_id': likedDocRec.docs.isNotEmpty ? likedDocRec.docs.first.id : null,
      'likes': likeNos,
      'isLiked': isExist ? 1 : 0,
    });
    // Comment Collection  doc reference manipulation
    final comments = (await commentCollectionRef.get()).docs
        .map((e) => (e.data()))
        .toList();
    storyInfo.addAll({'comments': comments});
    return StoryModel.fromJson(storyInfo);
  }
}
