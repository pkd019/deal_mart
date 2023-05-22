import 'package:deal_mart/Home/bottom.dart';
import 'package:deal_mart/pages/login%20page.dart';
import 'package:deal_mart/signup/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


import '../signup/auth.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('home'),
        ),
        drawer: Drawer(),
        body: Container(
          child: ElevatedButton(
            onPressed: () async {
              FirebaseAuth.instance.signOut();
              Get.off(loginpage());
              userdata.write("islogged", false);
            },
            child: Text('sign out'),
          ),
        ));
  }
}
