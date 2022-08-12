// ignore_for_file: unused_import

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lastburger/app/controllers/auth_controller.dart';

void dependencies() {
  Get.lazyPut<MenuController>(
    () => MenuController(),
  );
}

class MenuController extends GetxController {
  @override
  Future<void> onInit() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final authController = Get.find<AuthController>();
    authController.getuserinfo();
    uemail.value = authController.em;
    super.onInit();
  }

  RxString uemail = ''.obs;

  @override
  Future<void> onReady() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    final authController = Get.find<AuthController>();
    authController.getuserinfo();
    uemail.value = authController.em;
    super.onReady();
  }
}
