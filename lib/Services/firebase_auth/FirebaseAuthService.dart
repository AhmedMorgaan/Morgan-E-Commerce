import 'package:firebase_auth/firebase_auth.dart';
import 'package:morgan_e_commerce/core/utils/app_exceptions.dart';

class FirebaseAuthService {
  // Add your Firebase authentication methods here
  Future<User?> createUserWithEmailAndPassword(
      {required String email, required String password}) async {

    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      return credential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        throw AppException(errorMessage: 'The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        throw AppException(errorMessage: 'The account already exists for that email.');
      }
      else {
        throw AppException(errorMessage: e.message ?? 'An unknown error occurred.');
      }
    } catch (e) {
      throw AppException(errorMessage: 'An unknown error occurred.');
    }
  }
}