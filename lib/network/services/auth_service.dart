import 'package:firebase_auth/firebase_auth.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<UserCredential> signInUser() async {
    UserCredential userCredential = await _auth.signInAnonymously();
    return userCredential;
  }

  Future<void> signOutUser() async {
    await FirebaseAuth.instance.signOut();
  }
}
