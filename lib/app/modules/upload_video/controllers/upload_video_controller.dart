import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../shared/theme/color.dart';

class UploadVideoController extends GetxController {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  RxBool isLoading = false.obs;
  XFile? image;

  TextEditingController titleCtrl = TextEditingController();
  TextEditingController descriptionCtrl = TextEditingController();
  TextEditingController categoryCtrl = TextEditingController();
  TextEditingController videoURLCtrl = TextEditingController();
  TextEditingController priceCtrl = TextEditingController();

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  firebase_storage.FirebaseStorage storage =
      firebase_storage.FirebaseStorage.instance;
  ImagePicker picker = ImagePicker();

  void pickImage() async {
    image = await picker.pickImage(source: ImageSource.gallery);
    update();
  }

  //jika create video baru, user akan otomatis tersematkan di videonya, dapat user dr UID (PKnya)
  Future<DocumentSnapshot<Map<String, dynamic>>> futureProfile() async {
    String uid = auth.currentUser!.uid;
    var userData = firestore.collection("users").doc(uid).get();
    return userData;
  }

  //upload video
  void uploadVideo(String creator) async {
    if (image != null) {
      Map<String, dynamic> data = {
        "Title": titleCtrl.text,
        "Description": descriptionCtrl.text,
        "Category": categoryCtrl.text,
        "VideoURL": videoURLCtrl.text,
        "Price": priceCtrl.text,
        "Creator": creator,
        "CreatedAt": DateTime.now().toIso8601String(),
      };
      //jika berhasil upload, maka akan muncul snackbar
      try {
        isLoading.value = true;
        File file = File(image!.path);
        String fileExtension = image!.name.split(".").last;
        await storage.ref("${titleCtrl.text}.$fileExtension").putFile(file);
        String urlImage = await storage
            .ref("${titleCtrl.text}.$fileExtension")
            .getDownloadURL();
        data.addAll({"Thumbnail": urlImage});
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
    } else {
      // jika tidak ada gambar yang dipilih, maka akan muncul dialog
      Get.defaultDialog(
        title: "Something when wrong",
        middleText: "Image must be selected.",
        textConfirm: "Okay",
        onConfirm: () => Get.back(),
        buttonColor: primary,
        confirmTextColor: white,
      );
    }
  }
}
