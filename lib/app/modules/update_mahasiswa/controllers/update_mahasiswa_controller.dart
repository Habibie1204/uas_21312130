import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class UpdateProductController extends GetxController {
  late TextEditingController cNama;
  late TextEditingController cNpm;
  late TextEditingController cAlamat;

  FirebaseFirestore firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getData(String id) async {
    DocumentReference docRef = firestore.collection("mahasiswa").doc(id);
    return docRef.get();
  }

  Future<void> updateMahasiswa(
    String id,
    String nama,
    String npm,
    String alamat,
  ) async {
    DocumentReference mahasiswaById = firestore.collection("mahasiswa").doc(id);

    try {
      await mahasiswaById.update({
        "nama": nama,
        "npm": int.parse(npm),
        "alamat": alamat,
      });
      Get.snackbar("Success", "Data updated successfully");
    } catch (e) {
      print(e);
      Get.snackbar("Error", "Failed to update data");
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
