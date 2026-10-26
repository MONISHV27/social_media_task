import 'package:cloud_firestore/cloud_firestore.dart';

class PostService {
  Future<void> getPost() async {
    FirebaseFirestore.instance.collection('posts');
  }
}
