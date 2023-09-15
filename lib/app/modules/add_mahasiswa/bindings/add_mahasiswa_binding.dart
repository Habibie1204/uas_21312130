import 'package:get/get.dart';

import '../controllers/add_mahasiswa_controller.dart';

class AddProductBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AddmahasiswaController>(
      () => AddmahasiswaController(),
    );
  }
}
