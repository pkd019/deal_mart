



 import 'package:deal_mart/Home/bottom.dart';
import 'package:deal_mart/exception/sign%20up.dart';
import 'package:deal_mart/signup/login.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_phone_auth_handler/firebase_phone_auth_handler.dart';
import 'package:get/get.dart';

import '../pages/login page.dart';




 class authrlog extends GetxController {
   static authrlog get instatance => Get.find();

   ///variables***************************************************************************************

   final _auth = FirebaseAuth.instance;
   late final Rx<User?> firebaseUser;

   get verificationId => verificationId;


   /// using onready function******************************************************************************
   @override
   void onReady() {
     firebaseUser = Rx<User?>(_auth.currentUser);
     firebaseUser.bindStream(_auth.userChanges());
     ever(firebaseUser, _setInitialScreen);
   }

   /// checking user sign in or not ***********************************************************************

   _setInitialScreen(User? user) {
     user != null ? Get.offAll(() => bottomNav()) : Get.offAll(
         bottomNav());
   }


   ///for email verification*****************************************************************************************


   Future<void> signinEmailWithPassword(String email, String password) async {
     try {
       await _auth.signInWithEmailAndPassword(email: email, password: password);
       firebaseUser != null ? Get.offAll(() =>  bottomNav()) : Get.offAll(
           loginpage());
     } on FirebaseAuth catch (e) {
       final ex = SigninEmailWithPasswordfaliure.code('error');
       print(FirebaseAuthException(code: (ex.messsage)));
       throw ex;
       // TODO00

     }
   }

   Future<void> loginEmailWithPassword(String email, String password) async {
     try {
       await _auth.signInWithEmailAndPassword(email: email, password: password);
     } on FirebaseAuth catch (e) {
       // TODO

     }
     Future<void> logout() async => await _auth.signOut();
   }

 }


