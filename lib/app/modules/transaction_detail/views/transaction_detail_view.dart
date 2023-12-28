import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transaction_detail_controller.dart';

class TransactionDetailView extends GetView<TransactionDetailController> {
  const TransactionDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TransactionDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'TransactionDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
