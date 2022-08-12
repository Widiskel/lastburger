// ignore_for_file: must_call_super, avoid_print, unused_import

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:get/get.dart';
import 'package:lastburger/app/controllers/auth_controller.dart';
import 'package:lastburger/app/datamodel/userData.dart';

import 'dart:ffi';
import 'dart:math';

class ProfilController extends GetxController {
  String arg = "";
  @override
  void onInit() {
    arg = Get.arguments as String;
    print("arg $arg");
  }

  FirebaseFirestore db = FirebaseFirestore.instance;

  RxString uri = "".obs;
  void getImg(String imgname) async {
    final ref = FirebaseStorage.instance.ref().child(imgname);
// no need of the file extension, the name will do fine.
    var url = await ref.getDownloadURL();
    print(url);
  }

  Future<String> downloadFromFirebase() async {
    // Create reference

    try {
      final ref = FirebaseStorage.instance.ref().child(uri.value);
      String _myUrl = await ref.getDownloadURL();
      return _myUrl.toString();
    } on FirebaseException catch (e) {
      // Caught an exception from Firebase.
      print("Failed with error '${e.code}': ${e.message}");
    }
    return "nodata";
  }
}
