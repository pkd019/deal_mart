import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  static Signupcontroller get instance => Get.find();
  //this controller get data from user
  final email = TextEditingController();
  final name = TextEditingController();
  final phone = TextEditingController();
  final password = TextEditingController();

// this is for rejister user
  void rejister(String email, String phone, String password) {}
}
