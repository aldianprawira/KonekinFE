import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../controllers/transaction_detail_controller.dart';

class TransactionDetailView extends GetView<TransactionDetailController> {
  const TransactionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Transaction Detail'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Center(
              child: Text(
                "Payment Method",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              "Transfer Virtual Account",
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffDADADA),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              width: Get.width,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon/mandiri.png",
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    "Bank Mandiri",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 60),
                    child: Text("102000998086", style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffDADADA),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              width: Get.width,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon/bca.png",
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    "Bank BCA",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 90),
                    child: Text("102000998086", style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffDADADA),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              width: Get.width,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon/bsi.png",
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    "Bank BSI",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 95),
                    child: Text("102000998086", style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffDADADA),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              width: Get.width,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon/bni.png",
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    "Bank BNI",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 90),
                    child: Text("102000998086", style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text("Transfer Dompet Digital",
                style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffDADADA),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              width: Get.width,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon/dana.png",
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    "Dana",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 130),
                    child: Text("082269850831", style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffDADADA),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              width: Get.width,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon/ovo.png",
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    "OVO",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 130),
                    child: Text("082269850831", style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            Container(
              decoration: BoxDecoration(
                color: const Color(0xffDADADA),
                borderRadius: BorderRadius.circular(10),
              ),
              height: 60,
              width: Get.width,
              child: Row(
                children: [
                  Image.asset(
                    "assets/icon/gopay.png",
                    width: 50,
                    height: 50,
                  ),
                  const Text(
                    "Gopay",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 110),
                    child: Text("082269850831", style: TextStyle(fontSize: 15)),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            //konfirmasi telah membayar dengan checkbox
            Row(
              children: [
                Checkbox(
                  value: false,
                  onChanged: (bool? value) {},
                ),
                const Text("Saya telah membayar"),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: Get.width,
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () => Get.toNamed(Routes.TRANSACTION_DONE),
                    child: const Text("Lanjutkan Pembayaran"),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
