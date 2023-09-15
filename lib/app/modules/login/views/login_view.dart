import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:projek_get/app/routes/app_pages.dart';

import '../../../controllers/auth_controller.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final cAuth = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background Image from URL
          Image.network(
            'https://static.vecteezy.com/system/resources/previews/002/037/924/non_2x/abstract-blue-background-with-beautiful-fluid-shapes-free-vector.jpg',
            // Ganti dengan URL gambar latar belakang yang Anda inginkan
            fit: BoxFit.cover,
            height: double.infinity,
            width: double.infinity,
          ),

          // Content
          Container(
            padding: EdgeInsets.all(20), // Tambahkan padding di sini
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

                TextField(
                  controller: controller.cEmail,
                  decoration: InputDecoration(
                    labelText: "Email",
                  ),
                ),
                TextField(
                  controller: controller.CPass,
                  decoration: InputDecoration(
                    labelText: "Password",
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () => Get.toNamed(Routes.RESET_PASSWORD),
                    child: Text("Reset Password"),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  onPressed: () => cAuth.login(
                      controller.cEmail.text, controller.CPass.text),
                  child: Text("Login"),
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Belum Punya akun ?"),
                    TextButton(
                      onPressed: () => Get.toNamed(Routes.SIGNUP),
                      child: Text("Daftar Disini"),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                ElevatedButton(
                  onPressed: () => cAuth.LoginGoogle(),
                  child: Text("Login with Google"),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                    foregroundColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                // Tambahkan teks "Developed by Habibie Baehakim" di sini
                Center(
                  child: Text(
                    "Developed by Habibie Baehakim",
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.black,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
