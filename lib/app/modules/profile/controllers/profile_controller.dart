import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

/*
ProfileController adalah kelas Flutter menggunakan GetX yang bertanggung jawab 
untuk mengelola profil pengguna. Dalam kodenya, terdapat objek FirebaseAuth dan 
FirebaseFirestore yang mewakili instance dari Firebase Authentication dan Firestore. 
Method streamProfile() mengembalikan stream dari dokumen profil pengguna yang dipantau 
menggunakan Firebase Firestore, sementara logout() digunakan untuk melakukan logout 
dengan sign-out dari Firebase Authentication dan mengarahkan pengguna ke halaman 
pendaftaran menggunakan GetX navigation.
*/
class ProfileController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Stream<DocumentSnapshot<Map<String, dynamic>>> streamProfile() async* {
    String uid = auth.currentUser!.uid;
    yield* firestore.collection("users").doc(uid).snapshots();
  }

  void logout() async {
    await auth.signOut();
    Get.offAllNamed(Routes.REGISTER);
  }
}
