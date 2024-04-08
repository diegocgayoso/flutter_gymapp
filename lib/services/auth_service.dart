import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationService {
  FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  Future<String?> registerUser({
    required String name,
    required String email,
    required String password,
  }) async {
    try {
      UserCredential userCredential =
          await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      await userCredential.user!.updateDisplayName(name);

      return null;
    } on FirebaseAuthException catch (err) {
      if (err.code == "email-already-in-use") {
        return "O email já tem cadastro.";
      }
      if (err.code == "weak-password") {
        return "Senha deve ter 6 ou mais caracteres";
      }
      return "erro ${err.code}";
    }
  }
}
