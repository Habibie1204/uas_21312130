import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:projek_get/app/controllers/auth_controller.dart';

import 'app/routes/app_pages.dart';
import 'app/utils/loading.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final CAuth = Get.put(AuthController(), permanent: true);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: CAuth.streamAuthStatus,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.active) {
          if (snapshot.hasData) {
            final user = snapshot.data!;
            if (user.emailVerified) {
              return GetMaterialApp(
                title: "Application",
                initialRoute: Routes.HOME,
                getPages: AppPages.routes,
              );
            } else {
              return GetMaterialApp(
                title: "Application",
                initialRoute: Routes.LOGIN,
                getPages: AppPages.routes,
              );
            }
          } else {
            return GetMaterialApp(
              title: "Application",
              initialRoute: Routes.LOGIN,
              getPages: AppPages.routes,
            );
          }
        } else if (snapshot.connectionState == ConnectionState.waiting) {
          return Loading(); // Tampilkan widget loading jika sedang menunggu.
        } else {
          return Loading(); // Tampilkan widget loading jika terjadi kesalahan.
        }
      },
    );
  }
}
