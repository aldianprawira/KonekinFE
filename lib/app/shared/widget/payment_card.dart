import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PaymentCard extends StatelessWidget {
  final String image;
  final String bankName;
  final String bankAccountNumber;
  const PaymentCard({
    super.key,
    required this.image,
    required this.bankName,
    required this.bankAccountNumber,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.grey[200],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.asset(
            image,
            width: 50,
            height: 50,
          ),
          Text(
            bankName,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
          ),
          Expanded(
            child: Align(
              alignment: Alignment.centerRight,
              child: Text(bankAccountNumber, style: const TextStyle(fontSize: 16)),
            ),
          ),
        ],
      ),
    );
  }
}
