import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/transaction_done_controller.dart';

class TransactionDoneView extends GetView<TransactionDoneController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('TransactionDoneView'),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'TransactionDoneView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
