import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';

class LoginController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isHidden = true.obs;
  RxBool isLoading = false.obs;

  TextEditingController emailC = TextEditingController(text: "aldianprawira99@gmail.com");
  TextEditingController passC = TextEditingController(text: "admin123");

  FirebaseAuth auth = FirebaseAuth.instance;

  void login(String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential credential = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user!.emailVerified) {
        Get.offAllNamed(Routes.NAVBAR);
      } else {
        Get.defaultDialog(
          title: "Email verification",
          middleText: "You need to verify your email first",
          textConfirm: "Okay",
          onConfirm: () => Get.back(),
          textCancel: "Send again",
          onCancel: () async => await credential.user!.sendEmailVerification(),
          buttonColor: primary,
          confirmTextColor: white,
          cancelTextColor: primary,
        );
      }
    } on FirebaseAuthException catch (e) {
      print(e.code);
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        Get.defaultDialog(
          title: "User not found",
          middleText: "No user found for that email.",
          textConfirm: "Okay",
          onConfirm: () => Get.back(),
          buttonColor: primary,
          confirmTextColor: white,
        );
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        Get.defaultDialog(
          title: "Wrong password",
          middleText: "Wrong password provided for that user.",
          textConfirm: "Okay",
          onConfirm: () => Get.back(),
          buttonColor: primary,
          confirmTextColor: white,
        );
      }
      //TODO: Cek lagi untuk e.code 'invalid-credential'
      else if (e.code == 'invalid-credential') {
        print('Invalid credential provided for that user.');
        Get.defaultDialog(
          title: "Invalid credential",
          middleText: "Invalid credential provided for that user.",
          textConfirm: "Okay",
          onConfirm: () => Get.back(),
          buttonColor: primary,
          confirmTextColor: white,
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Something when wrong",
        middleText: "Unable to login this account",
        textConfirm: "Okay",
        onConfirm: () => Get.back(),
        buttonColor: primary,
        confirmTextColor: white,
      );
    } finally {
      isLoading.value = false;
    }
  }
}
