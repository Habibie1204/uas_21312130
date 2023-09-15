import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_get/app/controllers/auth_controller.dart';
import 'package:projek_get/app/routes/app_pages.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final cAuth = Get.find<AuthController>();

  void showOptions(id) async {
    var result = await Get.dialog(
      SimpleDialog(
        children: [
          ListTile(
            onTap: () {
              Get.back();
              Get.toNamed(
                Routes.UPDATE_MAHASISWA,
                arguments: id,
              );
            },
            title: Text('Update'),
          ),
          ListTile(
            onTap: () {
              Get.back();
              controller.deleteProduct(id);
            },
            title: Text('Delete'),
          ),
          ListTile(
            onTap: () => Get.back(),
            title: Text('Close'),
          ),
        ],
      ),
      barrierDismissible: false,
    );
  }

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
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => cAuth.logut(),
            icon: Icon(Icons.logout),
          )
        ],
      ),
      body: Stack(
        children: [
          // Background Image
          Image.network(
            'https://img.freepik.com/free-vector/blue-curve-frame-template_53876-114605.jpg',
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          // Data display
          Expanded(
            child: StreamBuilder<QuerySnapshot<Object?>>(
              stream:
                  controller.streamData(), // Ganti dengan stream yang benar.
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.active) {
                  // Mengambil data
                  var listAllDocs = snapshot.data!.docs;
                  return ListView.builder(
                    itemCount: listAllDocs.length,
                    itemBuilder: (context, index) => ListTile(
                      leading: CircleAvatar(
                        child: Text('${index + 1}'),
                        backgroundColor: Colors.white,
                      ),
                      title: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["nama"]}",
                      ),
                      subtitle: Text(
                        "${(listAllDocs[index].data() as Map<String, dynamic>)["npm"]}",
                      ),
                      trailing: IconButton(
                        onPressed: () => showOptions(listAllDocs[index].id),
                        icon: Icon(Icons.more_vert),
                      ),
                    ),
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.toNamed(Routes.ADD_MAHASISWA),
        child: Icon(Icons.add),
      ),
    );
  }
}
