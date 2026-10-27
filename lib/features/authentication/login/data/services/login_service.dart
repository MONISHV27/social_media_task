import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:social_media/core/auth_manager/credential_hash.dart';
import 'package:social_media/core/exceptions/auth_exceptions.dart';
import 'package:social_media/features/authentication/login/data/models/register_model.dart';

class LoginService {
  Future<String> login(RegisterModel userInfo) async {
    final querySnapshot = await FirebaseFirestore.instance
        .collection('users')
        .where('phone', isEqualTo: userInfo.phoneNo)
        .limit(1)
        .get();

    if (querySnapshot.docs.isEmpty) {}

    final userData = querySnapshot.docs.first.data();

    final bool isPasswordCorrect = CredentialHash.verifyHashData(
      userData['password'],
      userInfo.password,
    );

    if (isPasswordCorrect) {
      return querySnapshot.docs.first.id;
    } else {
      throw AuthException(
        message: 'Please check your credentials and try again!',
      );
    }
  }
}
