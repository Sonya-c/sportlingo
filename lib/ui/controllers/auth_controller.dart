import 'package:sportlingo/ui/controllers/user_controller.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthController extends GetxController {
  final databaseRef = FirebaseDatabase.instance.ref();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  final RxBool logged = false.obs;
  bool get isLogged => logged.value;

  Future<void> login(String email, String password) async {
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password);
      logged.value = true; // Update logged status
    } on FirebaseAuthException catch (e) {
      logged.value = false; // Update logged status
      if (e.code == 'user-not-found') {
        return Future.error("User not found");
      } else if (e.code == 'wrong-password') {
        return Future.error("Wrong password");
      }
    }
  }

  Future<void> signup(String name, String username, String email, String password) async {
    try {
      UserCredential uc = await FirebaseAuth.instance
          .createUserWithEmailAndPassword(email: email, password: password);

      UserController userController = Get.find();
      await userController.createUser(name, username, email, uc.user!.uid);

      logged.value = true; // Update logged status
    } on FirebaseAuthException catch (e) {
      logged.value = false; // Update logged status
      if (e.code == 'weak-password') {
        return Future.error("The password is too weak");
      } else if (e.code == 'email-already-in-use') {
        return Future.error("The email is taken");
      }
    }
  }
  Future<UserCredential?> loginWithGoogle() async {
    try {
      // Trigger the Google Sign In process
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();

      // If cancelled by user, googleUser will be null
      if (googleUser == null) return null;

      // Obtain the auth details from the request
      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      // Create a new credential for Firebase
      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      // Sign in to Firebase with the Google user credentials
      return await _auth.signInWithCredential(credential);
    } catch (e) {
      Get.snackbar("Login Error", "Failed to sign in with Google: $e");
      return null;
    }
  }
  
  Future<void> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        logged.value = false; // Update logged status
        return; // User cancelled the Google Sign-In process
      }

      final GoogleSignInAuthentication googleAuth = await googleUser.authentication;

      final AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: googleAuth.accessToken,
        idToken: googleAuth.idToken,
      );

      UserCredential uc = await FirebaseAuth.instance.signInWithCredential(credential);

      UserController userController = Get.find();
      await userController.createUser("Default", "Default", uc.user!.email!, uc.user!.uid);

      logged.value = true; // Update logged status
    } catch (e) {
      logged.value = false; // Update logged status
      return Future.error("Google Sign-In error");
    }
  }

  Future<void> logout() async {
    try {
      await FirebaseAuth.instance.signOut();
      await _googleSignIn.signOut();
      logged.value = false; // Update logged status
    } catch (e) {
      return Future.error("Logout error");
    }
  }

  String userEmail() {
    return FirebaseAuth.instance.currentUser?.email ?? "a@a.com";
  }

  String getUid() {
    return FirebaseAuth.instance.currentUser?.uid ?? "";
  }
}
