// ignore_for_file: prefer_const_constructors

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastburger/app/controllers/auth_controller.dart';
import 'package:lastburger/app/routes/app_pages.dart';
import 'package:lastburger/app/widget/pallete.dart';

import '../controllers/resetpass_controller.dart';

class ResetpassView extends GetView<ResetpassController> {
  ResetpassView({Key? key}) : super(key: key);
  final authController = Get.find<AuthController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appOldWhite,
      body: Container(
        height: Get.height,
        margin: EdgeInsets.symmetric(horizontal: 20),
        alignment: Alignment.center,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(
              Icons.lock_clock_rounded,
              size: Get.width * 0.6,
            ),
            SizedBox(
              height: 20,
            ),
            Flexible(
              child: TextField(
                  controller: controller.emailController,
                  decoration: InputDecoration(
                    labelText: "Email Address", //babel text
                    hintText: "Enter your email", //hint text
                    prefixIcon: Icon(Icons.mail_outline_rounded), //prefix iocn
                    hintStyle: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.bold), //hint text style
                    labelStyle:
                        TextStyle(fontSize: 15, color: appblack), //label style
                  )),
            ),
            SizedBox(
              height: 30,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: RichText(
                text: TextSpan(
                  text: "Ingin Login ?",
                  style: GoogleFonts.mPlusRounded1c(
                    textStyle: TextStyle(
                        height: 1,
                        fontSize: 15,
                        color: appOrange,
                        fontWeight: FontWeight.bold),
                  ),
                  recognizer: TapGestureRecognizer()
                    ..onTap = (() => Get.offAllNamed(Routes.HOME)),
                ),
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Center(
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                width: Get.width,
                height: 60,
                decoration: BoxDecoration(
                  color: appRed,
                  borderRadius: BorderRadius.circular(50),
                ),
                child: ElevatedButton(
                  onPressed: () =>
                      authController.resetpass(controller.emailController.text),
                  style: ElevatedButton.styleFrom(
                      primary: appOrange,
                      onPrimary: appwhite,
                      shape: StadiumBorder()),
                  child: Text(
                    "Reser Password",
                    style: GoogleFonts.mPlusRounded1c(
                      textStyle: TextStyle(
                        height: 1,
                        fontSize: 15,
                        color: appwhite,
                        letterSpacing: -1,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
