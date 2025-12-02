// import 'dart:developer';

// import 'package:google_sign_in/google_sign_in.dart';

// import '../helpers/utils.dart';
// import 'social_login_response.dart';

// class SocialLoginUtils {
//   static SocialLoginUtils instance = SocialLoginUtils();

//   Future<SocialLoginResponse?> loginWithGoogle() async {
//     try {
//       GoogleSignIn googleSignIn = GoogleSignIn(
//         scopes: ['email'],
//       );
//       final result = await googleSignIn.signIn();
//       if (result == null) {
//         return null;
//       }
//       final googleAuth = await result.authentication;
//       // ✅ اطبع الـ accessToken للتجربة
//       log("Google Access Token: ${googleAuth.accessToken}");
//       print("Google Access Token: ${googleAuth.accessToken}");
//       print("Google ID Token: ${googleAuth.idToken}");

//       return SocialLoginResponse(
//         id: result.id,
//         email: result.email,
//         name: result.displayName,
//         type: SocialLoginType.google,
//         accessToken: googleAuth.accessToken!,
//       );
//     } catch (e, s) {
//       log("google login error$e");
//       log("google login error trace$s");
//       Utils.log(e.toString());
//       Utils.log(s.toString());
//     }
//     return null;
//   }
// }
