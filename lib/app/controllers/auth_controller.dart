import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:projek_get/app/routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  void signup(String emailAddress, String password) async {
    try {
      UserCredential myUser = await auth.createUserWithEmailAndPassword(
        email: emailAddress,
        password: password,
      );
      await myUser.user!.sendEmailVerification();
      Get.defaultDialog(
          title: "Verifikasi email",
          middleText:
              "Kami telah mengirimkan veririvikasi ke email $emailAddress.",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "Ok");
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        Get.defaultDialog(
            title: "Terjadi kesalahan", middleText: "Email tidak valid");
        print('The password provided is too weak.');
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  void login(String emailAddress, String password) async {
    try {
      UserCredential myUser = await auth.signInWithEmailAndPassword(
          email: emailAddress, password: password);
      if (myUser.user!.emailVerified) {
        Get.offAllNamed(Routes.HOME);
      } else {
        Get.defaultDialog(
          title: "Verifikasi email",
          middleText: "Harap verifikasi email terlebih dahulu",
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        Get.defaultDialog(
            title: "Terjadi kesalahan", middleText: "Email tidak valid");
        print('No user found for that email.');
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
      }
    }
  }

  void logut() async {
    await auth.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }

  void resetpassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.defaultDialog(
          title: "Berhasil",
          middleText: "Kami telah mengirimkan reset password ke $email",
          onConfirm: () {
            Get.back();
            Get.back();
          },
          textConfirm: "OK",
        );
      } catch (e) {
        Get.defaultDialog(
            title: "Terjadi kesalahan",
            middleText: "Tidak dapat melakukan reset password.");
      }
    } else {
      Get.defaultDialog(
          title: "Terjadi kesalahan", middleText: "Email tidak valid");
    }
  }

  void LoginGoogle() async {
    try {
      GoogleSignIn googleSignIn = GoogleSignIn();
      GoogleSignInAccount? googleUser = await googleSignIn.signIn();

      if (googleUser != null) {
        final GoogleSignInAuthentication? googleAuth =
            await googleUser?.authentication;

        final credential = GoogleAuthProvider.credential(
          accessToken: googleAuth?.accessToken,
          idToken: googleAuth?.idToken,
        );

        await FirebaseAuth.instance.signInWithCredential(credential);
        Get.offNamed(Routes.HOME);
      } else {
        throw "Belum Memilih akun google";
      }
    } catch (error) {
      print(error);
      Get.defaultDialog(
        title: "terjadi kesalahan",
        middleText: "${error.toString()}",
      );
    }
  }
}
