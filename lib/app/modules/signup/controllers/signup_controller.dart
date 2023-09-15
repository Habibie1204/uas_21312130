import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignupController extends GetxController {
  //TODO: Implement SignupController

  final cEmail = TextEditingController();
  final CPass = TextEditingController();

  @override
  void onClose() {
    cEmail.dispose();
    CPass.dispose();
    super.onClose();
  }
}
