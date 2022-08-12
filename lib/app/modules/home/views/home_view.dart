// ignore_for_file: prefer_const_constructors, duplicate_ignore, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, avoid_print

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastburger/app/controllers/auth_controller.dart';
import 'package:lastburger/app/routes/app_pages.dart';
import 'package:lastburger/app/widget/pallete.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  final authController = Get.find<AuthController>();
  final homeC = Get.lazyPut<HomeController>(
    () => HomeController(),
  );
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: MaterialApp(
        home: Scaffold(
          backgroundColor: appOldWhite,
          body: Stack(
            children: [
              Column(
                children: [
                  Flexible(
                    child: Container(
                      height: Get.height * 0.35,
                      width: Get.width,
                      decoration: BoxDecoration(
                        color: appwhite,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        ),
                      ),
                      child: Center(
                        child: Container(
                          height: 120,
                          width: 120,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/logo/logobig.png'),
                                fit: BoxFit.contain),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Obx(
                () => Container(
                  margin: EdgeInsets.only(top: Get.height * 0.35),
                  child: TabBarView(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 35, left: 35),
                        child: ListView(
                          children: [
                            SizedBox(
                              height: Get.height * 0.69,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Flexible(
                                    child: TextField(
                                        controller: controller.emailController,
                                        decoration: InputDecoration(
                                          labelText:
                                              "Email Address", //babel text
                                          hintText:
                                              "Enter your email", //hint text
                                          prefixIcon: Icon(Icons
                                              .mail_outline_rounded), //prefix iocn
                                          hintStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight
                                                  .bold), //hint text style
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: appblack), //label style
                                        )),
                                  ),
                                  SizedBox(
                                    height: 30,
                                  ),
                                  Flexible(
                                    child: TextField(
                                      controller: controller.passController,
                                      obscureText: controller.isHidden.value,
                                      decoration: InputDecoration(
                                        labelText: "Password", //babel text
                                        hintText:
                                            "Enter your password", //hint text
                                        prefixIcon: Icon(
                                            Icons.key_outlined), //prefix iocn
                                        suffixIcon: IconButton(
                                          onPressed: () =>
                                              controller.isHidden.toggle(),
                                          icon: Icon(
                                              Icons.remove_red_eye_rounded),
                                        ),
                                        hintStyle: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight
                                                .bold), //hint text style
                                        labelStyle: TextStyle(
                                            fontSize: 15,
                                            color: appblack), //label style
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                  Align(
                                    alignment: Alignment.centerRight,
                                    child: RichText(
                                      text: TextSpan(
                                          text: "Forgot password ?",
                                          style: GoogleFonts.mPlusRounded1c(
                                            textStyle: TextStyle(
                                                height: 1,
                                                fontSize: 15,
                                                color: appOrange,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          recognizer: TapGestureRecognizer()
                                            ..onTap = (() => Get.offAllNamed(
                                                Routes.RESETPASS))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 35, left: 35),
                        child: ListView(
                          children: [
                            SizedBox(
                              height: Get.height * 0.69,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Flexible(
                                    child: TextField(
                                        controller: controller.nameSController,
                                        decoration: InputDecoration(
                                          labelText:
                                              "Nama Lengkap", //babel text
                                          hintText:
                                              "Masukkan alamat lengkap anda", //hint text
                                          prefixIcon: Icon(Icons
                                              .mail_outline_rounded), //prefix iocn
                                          hintStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight
                                                  .bold), //hint text style
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: appblack), //label style
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                    child: TextField(
                                        controller:
                                            controller.addressSController,
                                        decoration: InputDecoration(
                                          labelText: "Alamat", //babel text
                                          hintText:
                                              "Masukkan alamat anda", //hint text
                                          prefixIcon: Icon(Icons
                                              .mail_outline_rounded), //prefix iocn
                                          hintStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight
                                                  .bold), //hint text style
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: appblack), //label style
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                    child: TextField(
                                        controller:
                                            controller.notelpSController,
                                        decoration: InputDecoration(
                                          labelText: "No Telp", //babel text
                                          hintText:
                                              "Masukkan no HP anda", //hint text
                                          prefixIcon: Icon(Icons
                                              .mail_outline_rounded), //prefix iocn
                                          hintStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight
                                                  .bold), //hint text style
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: appblack), //label style
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                    child: TextField(
                                        controller: controller.emailSController,
                                        decoration: InputDecoration(
                                          labelText: "Email", //babel text
                                          hintText:
                                              "Masukkan email anda", //hint text
                                          prefixIcon: Icon(Icons
                                              .mail_outline_rounded), //prefix iocn
                                          hintStyle: TextStyle(
                                              fontSize: 17,
                                              fontWeight: FontWeight
                                                  .bold), //hint text style
                                          labelStyle: TextStyle(
                                              fontSize: 15,
                                              color: appblack), //label style
                                        )),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Flexible(
                                    child: TextField(
                                      obscureText: controller.isHidden2.value,
                                      controller: controller.passSController,
                                      decoration: InputDecoration(
                                        labelText: "Password", //babel text
                                        hintText:
                                            "Masukkan password anda", //hint text
                                        prefixIcon:
                                            Icon(Icons.key_outlined), //prefix
                                        suffixIcon: IconButton(
                                            onPressed: () =>
                                                controller.isHidden2.toggle(),
                                            icon: Icon(
                                                Icons.remove_red_eye_rounded)),
                                        hintStyle: TextStyle(
                                            fontSize: 17,
                                            fontWeight: FontWeight
                                                .bold), //hint text style
                                        labelStyle: TextStyle(
                                            fontSize: 15,
                                            color: appblack), //label style
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 50,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.height * 0.275),
                child: TabBar(
                  onTap: (index) {
                    print("$index");
                    print(controller.tabonchange(index));
                  },
                  tabs: <Widget>[
                    Tab(
                      text: "Login",
                    ),
                    Tab(
                      text: "Sign-Up",
                    ),
                  ],
                  labelColor: appblack,
                  indicatorPadding:
                      EdgeInsets.only(right: 35, left: 35, top: 43),
                  indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadiusDirectional.all(
                          Radius.circular(10),
                        ),
                      ),
                      color: appOrange),
                ),
              ),
              Obx(
                () => Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Center(
                      child: Container(
                        margin:
                            EdgeInsets.symmetric(vertical: 30, horizontal: 30),
                        width: Get.width,
                        height: 60,
                        decoration: BoxDecoration(
                          color: appRed,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: ElevatedButton(
                          onPressed: () {
                            if (controller.lab.value == "Login") {
                              print('Now login');
                              authController.login(
                                  controller.emailController.text,
                                  controller.passController.text);
                            } else if (controller.lab.value == "Sign-up") {
                              print('Now Sign Up');
                              authController.signup(
                                  controller.nameSController.text,
                                  controller.addressSController.text,
                                  controller.notelpSController.text,
                                  controller.emailSController.text,
                                  controller.passSController.text);
                            }
                          },
                          style: ElevatedButton.styleFrom(
                              primary: appOrange,
                              onPrimary: appwhite,
                              shape: StadiumBorder()),
                          child: Text(
                            controller.lab.value,
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
            ],
          ),
        ),
      ),
    );
  }
}
