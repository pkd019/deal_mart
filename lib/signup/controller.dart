import 'package:deal_mart/signup/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '';
import '../Home/bottom.dart';
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

  void phoneVerification(String phone) { authrepo.instatance.phoneVerification(phone);}
  }

class OTPController extends GetxController {
  static OTPController get instance => Get.find();

  void verifyOTP(String otp) async {
    var isVerified = await authrepo.instatance.verifyOTP(otp);
    isVerified ? Get.offAll( bottomNav()) : Get.back();
  }}

class logincontroller extends GetxController {
  static logincontroller get instance => Get.find();

  //this controller get data from user
  final email = TextEditingController();
  final password = TextEditingController();


// this is for rejister user
  void login(String email, String password) {
    String? error = authrepo.instatance.loginEmailWithPassword(email, password) as String ?;

    if (error != null) {
      Get.showSnackbar((GetSnackBar(message: error.toString(),)));
    }
  }

  void phoneVerification(String phone) { authrepo.instatance.phoneVerification(phone);}
}