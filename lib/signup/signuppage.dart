
import 'package:deal_mart/Home/bottom.dart';
import 'package:deal_mart/pages/login%20page.dart';
import 'package:deal_mart/pages/otp..dart';
import 'package:deal_mart/signup/auth.dart';
import 'package:get/get.dart';

import 'controller.dart';
import 'package:flutter/material.dart';

class signup extends StatefulWidget {
  const signup({super.key});

  @override
  State<signup> createState() => _signupState();
}

class _signupState extends State<signup> {
  @override
  Widget build(BuildContext context) {


    ///******************************AL CONTROLLERR NEEDED FOR TEXTFORMFILLED AND VERIFICATION**************************************8

    final controller = Get.put(Signupcontroller());

    final _formkey = GlobalKey<FormState>();
    String countryCode ="+91";

    return Scaffold(
      appBar: AppBar(title: Text('Sign Up'),),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 60, horizontal: 20),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(scrollDirection: Axis.vertical,
              child: Column(mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(height: 40,),

                  ///*************************************** NAME ************************************************************88888

                  TextFormField(

                    controller: controller.name,
                    decoration: InputDecoration(labelText: 'name',
                        focusColor: Colors.black,
                        hoverColor: Colors.black,
                        prefixIcon: Icon(Icons.person_outline_rounded),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.blue.shade100),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ///******************************** PHONE NUMBER *****************************************

                  TextFormField(
                    controller: controller.phone,
                    decoration: InputDecoration(labelText: 'phone number',
                        prefixIcon: Icon(Icons.call),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.blue.shade100),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ///******************************** EMAIL iD ***********************************************

                  TextFormField(validator: (value) {},
                    controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(labelText: 'mail id ',
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.blue.shade100),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  /// ***********************************PASSWORD *******************************************

                  TextFormField(
                    controller: controller.password,
                    decoration: InputDecoration(labelText: 'password',
                        prefixIcon: Icon(Icons.security),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.blue.shade100),
                    obscureText: true,),
                  SizedBox(
                    height: 100,
                  ),

                  /// **********************************PHONE VERIFICATION********************************************************

                  ElevatedButton(onPressed: () {
                    if (_formkey.currentState!.validate()){
                     // Signupcontroller.instance.register(controller.email.text.trim(),controller.password.text.trim());
                       Signupcontroller.instance.phoneVerification(controller.phone.text.trim());
                      Get.to((OTPscreen()));
                    }

                    },
                    child: Text('Sign in '),
                    style: ButtonStyle(),),

                  ///******************************** GOOGLE SIGN IN ***********************************************

                  ElevatedButton(onPressed: () {googleSignIn();Get.off(bottomNav());},
                    child: Text('google Sign in '),
                    style: ButtonStyle(),),

                  /// ****************************LOGIN PAGE ********************************************************

                  ElevatedButton(onPressed: (){Get.to(loginpage());}, child: Text('log in'))


                ],
              ),
            ),
          ),
        ));
  }
}

