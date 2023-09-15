import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  //TODO: Implement LoginController
  final cEmail = TextEditingController();
  final CPass = TextEditingController();

  @override
  void onClose() {
    cEmail.dispose();
    CPass.dispose();
    super.onClose();
  }
}
