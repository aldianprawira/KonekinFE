import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  //get data, query apa saja yang akan ditampilin di home
  Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    var listData = await firestore
        .collection("videos")
        .orderBy("CreatedAt", descending: true)
        .get();
    return listData;
  }
}
