import 'package:firebase_auth/firebase_auth.dart';

class Auth {
  final _auth = FirebaseAuth.instance;

  Future signUp(String email, String password) async {
    final authresult = await _auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return authresult;
  }

  Future signIn(String email, String password) async {
    final authresult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);
    return authresult;
  }
}
