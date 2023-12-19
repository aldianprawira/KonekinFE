import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';

class RegisterController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isHiddenPw = true.obs;
  RxBool isHiddenConfirmPw = true.obs;
  RxBool isLoading = false.obs;

  TextEditingController nameCtrl = TextEditingController();
  TextEditingController emailCtrl = TextEditingController();
  TextEditingController phoneCtrl = TextEditingController();
  TextEditingController passCtrl = TextEditingController();
  TextEditingController passValidationCtrl = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void register(String email, String password) async {
    try {
      isLoading.value = true;
      UserCredential credential = await auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      if (credential.user != null) {
        String uid = credential.user!.uid;
        await firestore.collection("users").doc(uid).set({
          "UID": uid,
          "Name": nameCtrl.text,
          "Email": emailCtrl.text,
          "Phone": phoneCtrl.text,
          "Role": "Audience",
          "CreatedAt": DateTime.now().toIso8601String(),
        });
        await credential.user!.sendEmailVerification();
        Get.defaultDialog(
          title: "Email verification",
          middleText: "We have sent a verification email to $email",
          textConfirm: "Login",
          onConfirm: () {
            Get.back();
            Get.offAllNamed(Routes.LOGIN);
          },
          buttonColor: primary,
          confirmTextColor: white,
        );
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.defaultDialog(
          title: "Weak password",
          middleText: "The password provided is too weak.",
          textConfirm: "Okay",
          onConfirm: () => Get.back(),
          buttonColor: primary,
          confirmTextColor: white,
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.defaultDialog(
          title: "Email already in use",
          middleText: "The account already exists for that email.",
          textConfirm: "Okay",
          onConfirm: () => Get.back(),
          buttonColor: primary,
          confirmTextColor: white,
        );
      }
    } catch (e) {
      Get.defaultDialog(
        title: "Something when wrong",
        middleText: "Unable to register this account",
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
