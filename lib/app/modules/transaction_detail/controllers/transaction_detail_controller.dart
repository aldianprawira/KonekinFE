import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../shared/theme/color.dart';

class TransactionDetailController extends GetxController {
  RxBool isLoading = false.obs;
  RxBool isPaid = false.obs;

  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void makeTransaction(String videoID) {
    String uid = auth.currentUser!.uid;
    Map<String, dynamic> data = {
      "UID": uid,
      "VideoID": videoID,
    };
    try {
      isLoading.value = true;
      firestore.collection("transaction").add(data);
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "Something when wrong",
        middleText: "Failed to make payment.",
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
