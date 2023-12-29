import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //get data, query apa saja yang akan ditampilin di home
  Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    QuerySnapshot<Map<String, dynamic>> listData = await firestore.collection("videos").orderBy("CreatedAt", descending: true).get();
    return listData;
  }

  Future<bool> checkTransactionExists(String videoID) async {
    String uid = auth.currentUser!.uid;
    QuerySnapshot<Map<String, dynamic>> listData = await firestore.collection("transaction").where("UID", isEqualTo: uid).where("VideoID", isEqualTo: videoID).get();
    return listData.docs.isNotEmpty;
  }
}
