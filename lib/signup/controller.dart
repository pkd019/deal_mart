import 'package:deal_mart/signup/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
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
  void register(String email, String password) {
      String? error = authrepo.instatance.createEmailWithPassword(email, password) as String ?;

      if (error != null) {
        Get.showSnackbar((GetSnackBar(message: error.toString(),)));
      }
    }
  }
