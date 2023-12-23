import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transaction_detail_controller.dart';

class TransactionDetailView extends GetView<TransactionDetailController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransactionDetailView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TransactionDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
