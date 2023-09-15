import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  FirebaseFirestore firrestore = FirebaseFirestore.instance;

  Future<QuerySnapshot<Object?>> GetData() async {
    CollectionReference products = firrestore.collection('mahasiswa');

    return products.get();
  }

  Stream<QuerySnapshot<Object?>> streamData() {
    CollectionReference products = firrestore.collection('mahasiswa');

    return products.snapshots();
  }

  void deleteProduct(String id) {
    DocumentReference docref = firrestore.collection("mahasiswa").doc(id);

    try {
      Get.defaultDialog(
        title: "Info",
        middleText: "Apakah anda yakin ingin menghapus data ini ?",
        onConfirm: () {
          docref.delete();
          Get.back();
        },
        textConfirm: "Ya",
        textCancel: "Batal",
      );
    } catch (e) {
      print(e);
      Get.defaultDialog(
        title: "terjadi kesalahan",
        middleText: "Tidak berhasil menghapus data",
      );
    }
  }
}
