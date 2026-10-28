import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/core/exceptions/auth_exceptions.dart';
import 'package:social_media/features/authentication/login/data/models/register_model.dart';

class RegisterService {
  const RegisterService();
  Future<String> register(RegisterModel userInfo) async {
    final usersCollection = FirebaseFirestore.instance.collection('users');

    final querySnapshot = await usersCollection
        .where('phone', isEqualTo: userInfo.phoneNo)
        .limit(1) // Optimization: stop searching as soon as one match is found
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      throw AuthException(message: 'Phone number already registered');
    }

    final collectionRef = await usersCollection.add({
      'phone': userInfo.phoneNo,
      'password': userInfo.password,
    });

    return (collectionRef.id);
  }
}
