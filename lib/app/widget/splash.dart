// ignore_for_file: prefer_const_constructors, sized_box_for_whitespace, depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lastburger/app/widget/pallete.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Color(0xFFEC2028),
        body: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Flexible(
                  child: Container(
                    width: Get.width,
                    height: Get.height * 0.6,
                    child: Container(
                      width: Get.width,
                      height: Get.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/img/toyy.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Flexible(
                  child: Container(
                    width: Get.width,
                    child: Stack(
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 50, left: 50),
                          width: Get.width * 0.2,
                          height: Get.width * 0.2,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(90),
                              color: appwhite,
                              image: DecorationImage(
                                  image: AssetImage('assets/logo/logo.png'))),
                        ),
                      ],
                    ),
                  ),
                ),
                Flexible(
                  child: Container(
                    margin: EdgeInsets.only(top: 10, left: 50),
                    width: Get.width,
                    child: Text(
                      'Food For \nEveryone',
                      style: GoogleFonts.mPlusRounded1c(
                        textStyle: TextStyle(
                            height: 1,
                            fontSize: 50,
                            color: appwhite,
                            letterSpacing: -1,
                            wordSpacing: -5,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Center(
                  child: Container(
                    height: Get.width * 0.6,
                    width: Get.width * 0.6,
                    margin: EdgeInsets.symmetric(vertical: 30),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(90),
                    ),
                    child: Center(
                      child: Lottie.asset("assets/lotties/burg.json"),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
