import 'package:deal_mart/Home/bottom.dart';
import 'package:deal_mart/pages/login%20page.dart';
import 'package:deal_mart/pages/otp..dart';
import 'package:deal_mart/signup/auth.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl_phone_field/intl_phone_field.dart';

import 'controller.dart';

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
    bool passToggle = true;
    void _togglePasswordView() {
      setState(() {
        passToggle = !passToggle;
      });
    }

    return Scaffold(
        appBar: AppBar(
          title: Text('Sign Up'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: _formkey,
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  SizedBox(
                    height: 40,
                  ),

                  ///*************************************** NAME ************************************************************88888

                  TextFormField(
                    controller: controller.name,
                    decoration: InputDecoration(
                        labelText: 'name',
                        prefixIcon: Icon(Icons.person_outline_rounded),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.blue.shade100),
                    validator: (name) {
                      if (name!.isEmpty) {
                        return " enter valid name";
                      }
                      return null;
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ///******************************** PHONE NUMBER *****************************************

                  IntlPhoneField(
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.blue.shade100,
                      labelText: 'Phone Number',
                      border: OutlineInputBorder(
                        borderSide: BorderSide(),
                      ),
                    ),
                    initialCountryCode: 'IN',
                    onChanged: (phone) {
                      print(phone.completeNumber);
                    },
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  ///******************************** EMAIL iD ***********************************************

                  TextFormField(
                    validator: (value) {
                      if (!EmailValidator.validate(value!)) {
                        return "Please enter a valid email";
                      }
                    },
                    controller: controller.email,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        labelText: 'mail id ',
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.blue.shade100),
                  ),
                  SizedBox(
                    height: 20,
                  ),

                  /// *********************************** PASSWORD *******************************************

                  TextFormField(
                      controller: controller.password,
                      decoration: InputDecoration(
                        labelText: 'password',
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.blue.shade100,
                        suffixIcon: InkWell(
                          onTap: _togglePasswordView,
                          child: Icon(
                            passToggle
                                ? Icons.visibility
                                : Icons.visibility_off,
                          ),
                        ),
                      ),
                      obscureText: passToggle,

                      /// ***************************************passord validator*****************************

                      validator: (value) {
                        if (value!.length < 8) {
                          return "make a strong password";
                        }
                        if (RegExp(
                                r'^(?=.?[A-Z])(?=.?[a-z])(?=.?[0-9])(?=.?[!@#$&*~]).{8,}$')
                            .hasMatch(value)) {
                          return "wrong password";
                        }
                        return null;
                      }),

                  SizedBox(
                    height: 100,
                  ),

                  /// **********************************PHONE VERIFICATION********************************************************

                  ElevatedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        // Signupcontroller.instance.register(controller.email.text.trim(),controller.password.text.trim());
                        Signupcontroller.instance
                            .phoneVerification(controller.phone.text.trim());
                        Get.to((OTPscreen()));
                      }
                    },
                    child: Text('Sign in '),
                    style: ButtonStyle(),
                  ),

                  ///******************************** GOOGLE SIGN IN ***********************************************

                  ElevatedButton(
                    onPressed: () {
                      googleSignIn();
                      Get.off(bottomNav());
                    },
                    child: Text('google Sign in '),
                    style: ButtonStyle(),
                  ),

                  /// ****************************LOGIN PAGE ********************************************************

                  ElevatedButton(
                      style: ButtonStyle(),
                      onPressed: () {
                        Get.off(loginpage());
                      },
                      child: Text('log in'))
                ],
              ),
            ),
          ),
        ));
  }
}
