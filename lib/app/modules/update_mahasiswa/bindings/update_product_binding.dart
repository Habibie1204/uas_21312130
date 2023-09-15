import 'package:get/get.dart';

import '../controllers/update_mahasiswa_controller.dart';

class UpdateProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<UpdateProductController>(
      () => UpdateProductController(),
    );
  }
}
