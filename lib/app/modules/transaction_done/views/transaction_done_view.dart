import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../routes/app_pages.dart';
import '../../../shared/theme/color.dart';
import '../controllers/transaction_done_controller.dart';

class TransactionDoneView extends GetView<TransactionDoneController> {
  final Map<String, dynamic> data = Get.arguments;
  TransactionDoneView({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransactionDoneView'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 40),
            Center(
              child: SizedBox(
                width: 200,
                child: Lottie.asset("assets/lottie/lottie_success.json"),
              ),
            ),
            const SizedBox(height: 16),
            const Text(
              "Payment Successful!",
              style: TextStyle(fontSize: 24),
            ),
            Expanded(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: SizedBox(
                  width: Get.width,
                  child: ElevatedButton(
                    onPressed: () => Get.offAllNamed(Routes.NAVBAR),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      backgroundColor: primary,
                    ),
                    child: const Text("Okay", style: TextStyle(fontSize: 20)),
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
