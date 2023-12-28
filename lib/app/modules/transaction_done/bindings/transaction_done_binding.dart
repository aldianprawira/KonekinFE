import 'package:get/get.dart';

import '../controllers/transaction_done_controller.dart';

class TransactionDoneBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TransactionDoneController>(
      () => TransactionDoneController(),
    );
  }
}
