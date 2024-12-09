import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class FirebaseAuthAPI {
  Future<UserCredential?> signIn() async {
    try {
      final GoogleSignInAccount? googleUser =
      await GoogleSignIn().signIn(); //google singin window

      final GoogleSignInAuthentication gSA = await googleUser!.authentication;

      final credential = GoogleAuthProvider.credential(
          idToken: gSA.idToken, accessToken: gSA.accessToken
      );

      final user = await FirebaseAuth.instance.signInWithCredential(credential);
      print(user.user?.email);
      return user;
    } catch (e) {
      print("Error: $e");
      return null;
    }
  }
}
