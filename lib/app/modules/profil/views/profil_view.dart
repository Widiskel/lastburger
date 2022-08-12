// ignore_for_file: prefer_const_constructors, avoid_print, unused_local_variable

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lastburger/app/controllers/auth_controller.dart';
import 'package:lastburger/app/routes/app_pages.dart';
import 'package:lastburger/app/widget/pallete.dart';

import '../controllers/profil_controller.dart';

class ProfilView extends GetView<ProfilController> {
  const ProfilView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded, color: Colors.black),
          onPressed: () => Get.toNamed(Routes.MENU),
        ),
        elevation: 0,
        backgroundColor: appOldWhite,
      ),
      body: Container(
        height: Get.height,
        width: Get.width,
        color: appOldWhite,
        padding: EdgeInsets.symmetric(horizontal: 30, vertical: 50),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(
                    "My profile",
                    style: GoogleFonts.mPlusRounded1c(
                      textStyle: TextStyle(
                          height: 1,
                          fontSize: 34,
                          color: appblack,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  children: [
                    Text(
                      "Personal details",
                      style: GoogleFonts.mPlusRounded1c(
                        textStyle: TextStyle(
                            height: 1,
                            fontSize: 18,
                            color: appblack,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.topRight,
                        child: RichText(
                          text: TextSpan(
                              text: "change ?",
                              style: GoogleFonts.mPlusRounded1c(
                                textStyle: TextStyle(
                                    height: 1,
                                    fontSize: 15,
                                    color: appOrange,
                                    fontWeight: FontWeight.bold),
                              ),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () {}),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
                  stream: controller.db.collection('users').snapshots(),
                  builder: (_, snapshot) {
                    if (snapshot.hasError) {
                      return Text('Error = ${snapshot.error}');
                    }
                    if (snapshot.hasData) {
                      var output = snapshot.data?.docs;
                      List<String> followingList = [];

                      output?.forEach((snapshot) {
                        if (snapshot.id.trim().contains(controller.arg) ==
                            true) {
                          followingList.add(snapshot.id);
                        }
                      });
                      print(followingList[0]);
                      return StreamBuilder<
                          DocumentSnapshot<Map<String, dynamic>>>(
                        stream: controller.db
                            .collection('users')
                            .doc(followingList[0])
                            .snapshots(),
                        builder: (_, snapshot) {
                          if (snapshot.hasError) {
                            return Text('Error = ${snapshot.error}');
                          }

                          if (snapshot.hasData) {
                            var output = snapshot.data!.data();
                            print("val : $output");
                            controller.uri.value = output?["img"];

                            return Container(
                              width: Get.width,
                              decoration: BoxDecoration(
                                color: appwhite,
                                borderRadius: BorderRadius.circular(30),
                              ),
                              padding: EdgeInsets.all(20),
                              child: Row(
                                children: [
                                  Flexible(
                                    child: Container(
                                      width: Get.width * 0.3,
                                      height: Get.width * 0.4,
                                      margin: EdgeInsets.only(right: 10),
                                      decoration: BoxDecoration(
                                        image: DecorationImage(
                                          image: NetworkImage(
                                              "https://firebasestorage.googleapis.com/v0/b/lastburger-f1edb.appspot.com/o/userprof%2F171328216_370784431522638_1416522029409982403_n.jpg?alt=media&token=fcd3affd-0d56-4d09-bcf7-05f0e19da1e2"),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(output?['Nama']),
                                      Text(output?['E-mail']),
                                      Divider(
                                        height: 10,
                                        thickness: 3,
                                        color: appblack,
                                      ),
                                      Text(output?['No HP']),
                                      Divider(
                                        height: 10,
                                        thickness: 3,
                                        color: appblack,
                                      ),
                                      Text(output?['Alamat']),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          }

                          return Center(child: CircularProgressIndicator());
                        },
                      );
                    }
                    return Center(child: CircularProgressIndicator());
                  },
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: Get.width,
                  height: Get.width * 0.2,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: appwhite,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Orders",
                        style: GoogleFonts.mPlusRounded1c(
                          textStyle: TextStyle(
                              height: 1,
                              fontSize: 18,
                              color: appblack,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: appGrey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: Get.width,
                  height: Get.width * 0.2,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: appwhite,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Pending Review",
                        style: GoogleFonts.mPlusRounded1c(
                          textStyle: TextStyle(
                              height: 1,
                              fontSize: 18,
                              color: appblack,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: appGrey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: Get.width,
                  height: Get.width * 0.2,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: appwhite,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "FaQ",
                        style: GoogleFonts.mPlusRounded1c(
                          textStyle: TextStyle(
                              height: 1,
                              fontSize: 18,
                              color: appblack,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: appGrey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: Get.width,
                  height: Get.width * 0.2,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: appwhite,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Help",
                        style: GoogleFonts.mPlusRounded1c(
                          textStyle: TextStyle(
                              height: 1,
                              fontSize: 18,
                              color: appblack,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Icon(
                            Icons.arrow_forward_ios_rounded,
                            color: appGrey,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: Get.width,
                  height: Get.width * 0.2,
                  alignment: Alignment.centerLeft,
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  decoration: BoxDecoration(
                    color: appwhite,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Row(
                    children: [
                      Text(
                        "Sign Out",
                        style: GoogleFonts.mPlusRounded1c(
                          textStyle: TextStyle(
                              height: 1,
                              fontSize: 18,
                              color: appblack,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Expanded(
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: IconButton(
                            icon: Icon(
                              Icons.door_front_door_rounded,
                              color: appOrange,
                            ),
                            onPressed: () => AuthController().signout(),
                          ),
                        ),
                      )
                    ],
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
