import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/add_mahasiswa_controller.dart';

class AddmahasiswaView extends GetView<AddmahasiswaController> {
  const AddmahasiswaView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: [
            Image.network(
              'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/UNIVERSITASTEKNOKRAT.png/1200px-UNIVERSITASTEKNOKRAT.png',
              height: 30,
              width: 30,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            Text('Pemograman Mobile 2'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://static.vecteezy.com/system/resources/previews/002/037/924/non_2x/abstract-blue-background-with-beautiful-fluid-shapes-free-vector.jpg', // Ganti dengan URL gambar latar belakang yang Anda inginkan
            ),
            fit: BoxFit.cover,
          ),
        ),
        padding: EdgeInsets.all(8),
        child: Column(
          children: [
            TextField(
              controller: controller.cNama,
              autocorrect: false,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "Nama"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cNpm,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(labelText: "Npm"),
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              controller: controller.cAlamat,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(labelText: "alamat"),
            ),
            ElevatedButton(
              onPressed: () => controller.addmahasiswa(
                controller.cNama.text,
                controller.cNpm.text,
                controller.cAlamat.text,
              ),
              child: Text("Simpan"),
            ),
          ],
        ),
      ),
    );
  }
}
