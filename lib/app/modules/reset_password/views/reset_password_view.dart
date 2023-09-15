import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_get/app/routes/app_pages.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/reset_password_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final cEmail = TextEditingController();
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset Password'),
        centerTitle: true,
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
        padding: EdgeInsets.all(20),
        child: ListView(
          children: [
            // Logo and Text
            Row(
              children: [
                // Logo from Google
                Image.network(
                  'https://upload.wikimedia.org/wikipedia/commons/thumb/a/a0/UNIVERSITASTEKNOKRAT.png/1200px-UNIVERSITASTEKNOKRAT.png',
                  height: 80,
                  width: 80,
                ),
                SizedBox(width: 8), // Spasi antara logo dan teks
                // Text "Universitas Teknokrat Indonesia" with uppercase for U, T, and I
                Text(
                  'U',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                // Text "NIVERSITAS"
                Text(
                  'NIVERSITAS',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'T',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),

                // Text "NIVERSITAS"
                Text(
                  'EKNOKRAT',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Text(
                  'I',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
                // Text "NIVERSITAS"
                Text(
                  'NDONESIA',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.all(10),
              child: Column(
                children: [
                  TextField(
                    controller: cEmail,
                    decoration: InputDecoration(labelText: "Email"),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  ElevatedButton(
                    onPressed: () => cAuth.resetpassword(cEmail.text),
                    child: Text("Reset Password"),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sudah punya akun ?"),
                      TextButton(
                        onPressed: () => Get.toNamed(Routes.LOGIN),
                        child: Text("Klik di sini"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
