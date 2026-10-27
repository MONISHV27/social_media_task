import 'package:bcrypt/bcrypt.dart';

class CredentialHash {
  const CredentialHash();

  String hashMetadata(String rawdata) {
    final String hashed = BCrypt.hashpw(rawdata, BCrypt.gensalt());
    return hashed;
  }

  static bool verifyHashData(String hashedData, String rawData) {
    final bool checkPassword = BCrypt.checkpw(rawData, hashedData);
    return checkPassword;
  }
}
