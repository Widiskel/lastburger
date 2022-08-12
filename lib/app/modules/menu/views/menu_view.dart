// ignore_for_file: prefer_const_constructors, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:lastburger/app/controllers/auth_controller.dart';
import 'package:lastburger/app/routes/app_pages.dart';

import '../controllers/menu_controller.dart';

class MenuView extends GetView<MenuController> {
  MenuView({Key? key}) : super(key: key);

  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("email"),
            Center(child: Text(controller.uemail.value)),
            Center(
              child: ElevatedButton(
                onPressed: () => authController.signout(),
                child: Text('Sign Out'),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            Center(
              child: ElevatedButton(
                onPressed: () => Get.toNamed(Routes.PROFIL,
                    arguments: controller.uemail.value),
                child: Text('profile'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
