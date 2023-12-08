import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';

class RegisterCreatorController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  TextEditingController bankNameC = TextEditingController();
  TextEditingController bankAccNumC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void registerCreator(String uid) async {
    Map<String, dynamic> data = {
      "BankName": bankNameC.text,
      "BankAccNum": bankAccNumC.text,
      "Role": "Creator",
    };
    try {
      isLoading.value = true;
      await firestore.collection("users").doc(uid).update(data);
      Get.snackbar("Succeed", "Successfully created a creator account.", backgroundColor: white);
      Get.offAllNamed(Routes.NAVBAR_CREATOR);
    } catch (e) {
      Get.defaultDialog(
        title: "Something when wrong",
        middleText: "Failed to create a creator account",
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
