import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeCreatorController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    String uid = auth.currentUser!.uid;
    var userData = await firestore.collection("users").doc(uid).get();
    var name = userData.data()!["Name"];
    print(name);
    var listData = await firestore.collection("videos").where("Creator", isEqualTo: name).orderBy("CreatedAt", descending: true).get();
    return listData;
  }
}
