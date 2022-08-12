// ignore_for_file: file_names

import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';

class DataUser {
  final String? nama;
  final String? alamat;
  final Int? notelp;
  final bool? email;
  final String? pass;

  DataUser({
    this.nama,
    this.alamat,
    this.notelp,
    this.email,
    this.pass,
  });

  factory DataUser.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
    SnapshotOptions? options,
  ) {
    final data = snapshot.data();
    return DataUser(
      nama: data?['Nama'],
      alamat: data?['Alamat'],
      notelp: data?['No Telp'],
      email: data?['E-mail'],
      pass: data?['Password'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      if (nama != null) "Nama": nama,
      if (alamat != null) "Alamat": alamat,
      if (notelp != null) "No Telp": notelp,
      if (email != null) "E-mail": email,
      if (pass != null) "Password": pass,
    };
  }
}
