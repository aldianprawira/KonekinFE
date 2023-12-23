import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../shared/theme/color.dart';

class UploadVideoController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController categoryCtrl = TextEditingController();
  TextEditingController videoURLCtrl = TextEditingController();
  TextEditingController thumbnailURLCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //jika create video baru, user akan otomatis tersematkan di videonya, dapat user dr UID (PKnya)
  Future<DocumentSnapshot<Map<String, dynamic>>> futureProfile() async {
    String uid = auth.currentUser!.uid;
    var userData = firestore.collection("users").doc(uid).get();
    return userData;
  }

  //upload video
  void uploadVideo(String creator) async {
    Map<String, dynamic> data = {
      "Title": titleCtrl.text,
      "Description": descriptionCtrl.text,
      "Category": categoryCtrl.text,
      "VideoURL": videoURLCtrl.text,
      "Thumbnail": thumbnailURLCtrl.text,
      "Price": priceCtrl.text,
      "Creator": creator,
      "CreatedAt": DateTime.now().toIso8601String(),
    };
    //jika berhasil upload, maka akan muncul snackbar
    try {
      isLoading.value = true;
      await firestore.collection("videos").add(data);
      Get.back();
      Get.snackbar("Succeed", "Successfully uploaded video.",
          backgroundColor: white);
      //jika gagal upload, maka akan muncul dialog
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Something when wrong",
        middleText: "Failed to upload video.",
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
