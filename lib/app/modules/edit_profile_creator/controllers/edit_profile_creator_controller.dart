import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/theme/color.dart';

class EditProfileCreatorController extends GetxController {
  final formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  TextEditingController bankNameC = TextEditingController();
  TextEditingController bankAccNumC = TextEditingController();

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void editProfile(String uid) async {
    Map<String, dynamic> data = {
      "BankName": bankNameC.text,
      "bankAccNumC": bankAccNumC.text,
    };
    try {
      isLoading.value = true;
      await firestore.collection("users").doc(uid).update(data);
      Get.back();
      Get.snackbar("Succeed", "Successfully updated profile.",
          backgroundColor: white);
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Something when wrong",
        middleText: "Failed to update profile.",
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
