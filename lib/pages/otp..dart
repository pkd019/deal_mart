


import 'package:deal_mart/Home/bottom.dart';
import 'package:deal_mart/Home/home.dart';
import 'package:deal_mart/pages/login%20page.dart';
import 'package:deal_mart/signup/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';

import '../signup/controller.dart';
var authreo = Get.lazyPut(() => authrepo());
var otpController = Get.lazyPut(() => OTPController());
var otp=" " ;
final _auth = FirebaseAuth.instance;

class OTPscreen extends StatelessWidget {
  const OTPscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Container(
      padding: const EdgeInsets.all(10),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'otp',
            style: GoogleFonts.montserrat(
                fontWeight: FontWeight.bold, fontSize: 80.0),
          ),
          Text("OtpSubTitle".toUpperCase(), style: Theme
              .of(context)
              .textTheme
              .headline6),
          const SizedBox(height: 40.0),
          const Text(" support@codingwitht.com", textAlign: TextAlign.center),
          const SizedBox(height: 20.0),
          Pinput(
            mainAxisAlignment: MainAxisAlignment.center,
            length: 6,
            enabled: true,
            onSubmitted: (code){
              otp = code;
              Get.put(otpController);
              OTPController.instance.verifyOTP(otp);
            },
          ),
          SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(onPressed: () {
           OTPController.instance.verifyOTP(otp);
                userdata.write('islogged',true);
              Get.off(bottomNav());


              }, child: const Text("Next")),
          ),
        ],
      ),

    ));
  }
}
