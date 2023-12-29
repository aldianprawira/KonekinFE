import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';
import '../../../shared/widget/payment_card.dart';
import '../controllers/transaction_detail_controller.dart';

class TransactionDetailView extends GetView<TransactionDetailController> {
  final Map<String, dynamic> data = Get.arguments;
  final String videoID = Get.arguments["VideoID"];
  TransactionDetailView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Payment Method'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Virtual Account Transfer",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const PaymentCard(
              image: "assets/icon/mandiri.png",
              bankName: "Bank Mandiri",
              bankAccountNumber: "102000998086",
            ),
            const SizedBox(height: 8),
            const PaymentCard(
              image: "assets/icon/bca.png",
              bankName: "Bank BCA",
              bankAccountNumber: "102000998086",
            ),
            const SizedBox(height: 8),
            const PaymentCard(
              image: "assets/icon/bsi.png",
              bankName: "Bank BSI",
              bankAccountNumber: "102000998086",
            ),
            const SizedBox(height: 8),
            const PaymentCard(
              image: "assets/icon/bni.png",
              bankName: "Bank BNI",
              bankAccountNumber: "102000998086",
            ),
            const SizedBox(height: 24),
            const Text(
              "Digital Wallet Transfer",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 8),
            const PaymentCard(
              image: "assets/icon/dana.png",
              bankName: "Dana",
              bankAccountNumber: "081398844808",
            ),
            const SizedBox(height: 8),
            const PaymentCard(
              image: "assets/icon/ovo.png",
              bankName: "OVO",
              bankAccountNumber: "081398844808",
            ),
            const SizedBox(height: 8),
            const PaymentCard(
              image: "assets/icon/gopay.png",
              bankName: "Gopay",
              bankAccountNumber: "081398844808",
            ),
            const SizedBox(height: 8),
            Row(
              children: [
                Obx(
                  () => Checkbox(
                    value: controller.isPaid.value,
                    onChanged: (value) => controller.isPaid.value = value!,
                    activeColor: primary,
                  ),
                ),
                const Text("I have paid"),
              ],
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: Get.width,
                  child: Obx(
                    () => ElevatedButton(
                      onPressed: () {
                        if (controller.isPaid.isTrue) {
                          controller.makeTransaction(videoID);
                          Get.toNamed(Routes.TRANSACTION_DONE, arguments: data);
                        } else {
                          Get.defaultDialog(
                            title: "Checkbox",
                            middleText: "Please tick the checkbox!",
                            textConfirm: "Okay",
                            onConfirm: () {
                              Get.back();
                            },
                            buttonColor: primary,
                            confirmTextColor: white,
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        backgroundColor: controller.isLoading.isFalse ? primary : Colors.grey,
                      ),
                      child: controller.isLoading.isFalse
                          ? const Text(
                              "Continue Payment",
                              style: TextStyle(fontSize: 20),
                            )
                          : const Text(
                              "Loading...",
                              style: TextStyle(fontSize: 20),
                            ),
                    ),
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
