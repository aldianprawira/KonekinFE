import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Map<String, dynamic>>> getData() async {
    var listData = firestore.collection("videos").where("Category", isEqualTo: "Science").orderBy("CreatedAt").get();
    return listData;
  }
}
