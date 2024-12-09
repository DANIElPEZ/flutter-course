import 'package:firebase_auth/firebase_auth.dart';
import 'package:trips/User/repository/firebase_auth_api.dart';

class AuthRepository{
  final _firebaseAuhtAPI=FirebaseAuthAPI();

  Future<UserCredential?> singInFirebase() async {
    return _firebaseAuhtAPI.signIn();
  }
}