import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/update_mahasiswa_controller.dart';

class UpdatemahasiswaView extends GetView<UpdateProductController> {
  const UpdatemahasiswaView({Key? key}) : super(key: key);

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
            Text('Selamat datang'),
          ],
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://static.vecteezy.com/system/resources/previews/002/037/924/non_2x/abstract-blue-background-with-beautiful-fluid-shapes-free-vector.jpg',
            ),
            fit: BoxFit.cover,
          ),
        ),
        child: FutureBuilder<DocumentSnapshot>(
          future: controller.getData(Get.arguments),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text("Error: ${snapshot.error}"),
              );
            } else if (!snapshot.hasData) {
              return Center(
                child: Text("Data not found"),
              );
            }

            var data = snapshot.data!.data() as Map<String, dynamic>;
            controller.cNama.text = data['nama'];
            controller.cNpm.text = data['npm'].toString();
            controller.cAlamat.text = data['alamat'];

            return Padding(
              padding:
                  const EdgeInsets.all(8), // Sesuaikan dengan kebutuhan Anda
              child: Column(
                children: [
                  TextField(
                    controller: controller.cNama,
                    autocorrect: false,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Nama"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.cNpm,
                    textInputAction: TextInputAction.done,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(labelText: "NPM"),
                  ),
                  SizedBox(height: 10),
                  TextField(
                    controller: controller.cAlamat,
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(labelText: "Alamat"),
                  ),
                  SizedBox(height: 30),
                  ElevatedButton(
                    onPressed: () => controller.updateMahasiswa(
                      Get.arguments,
                      controller.cNama.text,
                      controller.cNpm.text,
                      controller.cAlamat.text,
                    ),
                    child: Text("UBAH"),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
