import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class SocialLoginUtils {
  static SocialLoginUtils instance = SocialLoginUtils();

  final FirebaseAuth _auth = FirebaseAuth.instance;


  Future<UserCredential?> loginWithGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn(scopes: ['email']);

      final googleUser = await googleSignIn.signIn();
      if (googleUser == null) return null;

      final googleAuth = await googleUser.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      final userCredential =
          await _auth.signInWithCredential(credential);

      return userCredential;
    } catch (e, s) {
      log("Google Firebase Login Error: $e");
      log("StackTrace: $s");
      return null;
    }
  }


}
