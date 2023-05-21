
import 'package:deal_mart/pages/login%20page.dart';
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
    final controller = Get.put(Signupcontroller());

    final _formkey = GlobalKey<FormState>();

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

                  ElevatedButton(onPressed: () {
                    if (_formkey.currentState!.validate()){
                      Signupcontroller.instance.register(controller.email.text.trim(),controller.password.text.trim());
                    } {

                    }},
                    child: Text('Sign in '),
                    style: ButtonStyle(),),

                  ElevatedButton(onPressed: () {googleSignIn();},
                    child: Text('google Sign in '),
                    style: ButtonStyle(),),
                  ElevatedButton(onPressed: (){Get.to(loginpage());}, child: Text('log in'))


                ],
              ),
            ),
          ),
        ));
  }
}

