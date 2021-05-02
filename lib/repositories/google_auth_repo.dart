import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class GoogleAuthRepo {
  final googleSignIn = GoogleSignIn();
  bool _isSigningIn = false;

  bool get isSignIn => _isSigningIn;

  void setSignIn(bool isSignIn) {
    _isSigningIn = isSignIn;
  }

  User getConnectedUser() => FirebaseAuth.instance.currentUser;

  Future login() async {
    setSignIn(true);
    final user = await googleSignIn.signIn();

    if (user == null) {
      setSignIn(false);
      return;
    } else {
      final googleAuth = await user.authentication;
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      await FirebaseAuth.instance.signInWithCredential(credential);
      setSignIn(false);
    }
  }

  Future<void> logout() async {
    setSignIn(true);
    if (await googleSignIn.isSignedIn()) await googleSignIn.disconnect();
    await FirebaseAuth.instance.signOut();
    setSignIn(false);
  }

  Future loginWithEmail(String email, String password) async {
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(email: email, password: password);
    setSignIn(true);
  }
}
