import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/theme/color.dart';

class EditProfileController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

//TODO: Cek lagi untuk isHidden
  RxBool isHidden = true.obs;
  RxBool isLoading = false.obs;
  XFile? image;

  // pembuatan controller untuk textfield
  TextEditingController nameC = TextEditingController();
  TextEditingController emailC = TextEditingController();
  TextEditingController phoneC = TextEditingController();

//TODO: Cek lagi untuk validasi password
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  ImagePicker picker = ImagePicker();

  void editProfile(String uid) async {
    Map<String, dynamic> data = {
      "Name": nameC.text,
      "Phone": phoneC.text,
    };
    try {
      isLoading.value = true;
      if (image != null) {
        // upload image
        File file = File(image!.path);
        String fileExtension = image!.name.split(".").last;
        await storage.ref("$uid/profile.$fileExtension").putFile(file);
        String urlImage =
            await storage.ref("$uid/profile.$fileExtension").getDownloadURL();
        data.addAll({"ProfilePict": urlImage});
      }
      await firestore.collection("users").doc(uid).update(data);
      Get.back();
      // pesan berhasil
      Get.snackbar("Succeed", "Successfully updated profile.",
          backgroundColor: white);
    } catch (e) {
      // pesan gagal
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

// TODO: Cek lagi untuk pickImage
  void pickImage() async {
    Get.back();
    image = await picker.pickImage(source: ImageSource.gallery);
    update();
  }

  void deleteProfilePict(String uid) async {
    // hapus profile picture
    try {
      Get.back();
      await firestore.collection("users").doc(uid).update({
        "ProfilePict": FieldValue.delete(),
      });
      Get.back();
      Get.snackbar("Succeed", "Successfully removed profile picture.",
          backgroundColor: white);
    } catch (e) {
      // pesan gagal
      print(e);
      Get.defaultDialog(
        title: "Something when wrong",
        middleText: "Failed to remove profile picture.",
        textConfirm: "Okay",
        onConfirm: () => Get.back(),
        buttonColor: primary,
        confirmTextColor: white,
      );
    }
  }
}
