// ignore_for_file: unnecessary_overrides, unused_local_variable, non_constant_identifier_names, dead_code, unnecessary_brace_in_string_interps, avoid_print, unused_import

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  RxBool isHidden = true.obs;
  RxBool isHidden2 = true.obs;

  RxString lab = "Login".obs;
  String tabonchange(int idx) {
    if (idx == 0) {
      lab.value = "Login";
      return "Login";
    } else {
      lab.value = "Sign-up";
      return "Sign-Up";
    }
    print("will be returned ${lab}");
  }

  //login
  TextEditingController emailController =
      TextEditingController(text: 'waputra16@gmail.com');
  TextEditingController passController = TextEditingController(text: '123123');

  //signup
  TextEditingController nameSController = TextEditingController(text: '');
  TextEditingController addressSController = TextEditingController(text: '');
  TextEditingController notelpSController = TextEditingController(text: '');
  TextEditingController emailSController = TextEditingController(text: '');
  TextEditingController passSController = TextEditingController(text: '');

  @override
  void onClose() {
    emailController.dispose();
    passController.dispose();
    passSController.dispose();
    emailSController.dispose();
    notelpSController.dispose();
    addressSController.dispose();
    nameSController.dispose();
    super.onClose();
  }
}
