// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors, avoid_print, unused_import

import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/services.dart';
import 'package:lastburger/app/controllers/auth_controller.dart';
import 'package:lastburger/app/modules/home/controllers/home_controller.dart';
import 'package:lastburger/app/modules/home/views/home_view.dart';
import 'package:get/get.dart';
import 'package:lastburger/app/widget/splash.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'app/routes/app_pages.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersiveSticky);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final authC = Get.put(
    AuthController(),
    permanent: true,
  );
  @override
  Widget build(BuildContext context) {
    // return GetMaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   title: "Application",
    //   initialRoute: Routes.HOME,
    //   getPages: AppPages.routes,
    // );
    return FutureBuilder(
      future: Future.delayed(Duration(seconds: 0)),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return SplashScreen();
        } else {
          return StreamBuilder<User?>(
            stream: authC.streamAuthState,
            builder: (context, snapshot) {
              print(snapshot.data);
              if (snapshot.connectionState == ConnectionState.active) {
                return GetMaterialApp(
                  debugShowCheckedModeBanner: false,
                  title: "Last Burger",
                  initialRoute: snapshot.data != null &&
                          snapshot.data!.emailVerified == true
                      ? Routes.MENU
                      : Routes.HOME,
                  getPages: AppPages.routes,
                );
              } else {
                return HomeView();
              }
            },
          );
        }
      },
    );
  }
}
