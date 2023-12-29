import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';

/*

ProfileCreatorController adalah kelas dalam Flutter dengan GetX yang mengelola 
pembuatan profil pengguna. Dalam kode tersebut, terdapat objek FirebaseAuth dan 
FirebaseFirestore yang merepresentasikan Firebase Authentication dan Firestore. 
Method streamProfile() menghasilkan stream dari snapshot dokumen profil pengguna 
yang dipantau menggunakan Firebase Firestore. Method logout() digunakan untuk 
melakukan logout, yaitu dengan sign-out dari Firebase Authentication, dan kemudian 
mengarahkan pengguna ke halaman pendaftaran menggunakan GetX navigation.
*/
class ProfileCreatorController extends GetxController {
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
