import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddmahasiswaController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  void addmahasiswa(
    String nama,
    String npm,
    String alamat,
  ) async {
    CollectionReference mahasiswaCollection = firestore.collection("mahasiswa");

    try {
      await mahasiswaCollection.add({
        "nama": nama,
        "npm": npm,
        "alamat": alamat,
      });
      Get.defaultDialog(
        title: "Berhasil",
        middleText: "Berhasil menyimpan data mahasiswa",
        onConfirm: () {
          cNama.clear();
          cNpm.clear();
          cAlamat.clear();

          Get.back();
        },
      );
    } catch (e) {
      // Handle any potential errors here
      print("Error: $e");
    }
  }

  @override
  void onInit() {
    cNama = TextEditingController();
    cNpm = TextEditingController();
    cAlamat = TextEditingController();

    super.onInit();
  }

  @override
  void onClose() {
    cNama.dispose();
    cNpm.dispose();
    cAlamat.dispose();

    super.onClose();
  }
}
