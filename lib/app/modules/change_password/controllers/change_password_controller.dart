import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/theme/color.dart';

class ChangePasswordController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isHidden = true.obs;
  RxBool isHidden2 = true.obs;
  RxBool isHidden3 = true.obs;
  RxBool isLoading = false.obs;

  // pembuatan controller untuk textfield
  TextEditingController currentPassC = TextEditingController();
  TextEditingController newPassC = TextEditingController();
  TextEditingController newPassValidationC = TextEditingController();

  // untuk validasi password
  FirebaseAuth auth = FirebaseAuth.instance;

  void changePassword() async {
    try {
      // cek apakah password baru dan konfirmasi password sama
      isLoading.value = true;
      String email = auth.currentUser!.email!;
      await auth.signInWithEmailAndPassword(
          email: email, password: currentPassC.text);
      await auth.currentUser!.updatePassword(newPassC.text);
      Get.back();
      Get.snackbar("Succeed", "Successfully changed password",
          backgroundColor: white);
      // await auth.signOut();
      // await auth.signInWithEmailAndPassword(email: email, password: newPassC.text);
      // Get.offAllNamed(Routes.NAVBAR);
    } on FirebaseAuthException catch (e) {
      print(e.code);
      //TODO: Cek lagi untuk e.code 'user-not-found'
      if (e.code == 'wrong-password') {
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
          title: "Wrong password",
          middleText: "Wrong password provided for that user.",
          textConfirm: "Okay",
          onConfirm: () => Get.back(),
          buttonColor: primary,
          confirmTextColor: white,
        );
      } else if (e.code == 'weak-password') {
        //TODO: Cek lagi untuk e.code 'weak-password'
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: "Weak password",
          middleText: "The password provided is too weak.",
          textConfirm: "Okay",
          onConfirm: () => Get.back(),
          buttonColor: primary,
          confirmTextColor: white,
        );
      }
    } catch (e) {
      //TODO: Cek lagi untuk e.code 'user-not-found'
      Get.defaultDialog(
        title: "Something when wrong",
        middleText: "Unable to change password",
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
