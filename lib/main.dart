import 'package:deal_mart/Home/bottom.dart';
import 'package:deal_mart/pages/login%20page.dart';
import 'package:deal_mart/signup/auth.dart';
import 'package:deal_mart/signup/signuppage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get_storage/get_storage.dart';

import 'Home/home.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().then((value) => Get.put(authrepo()));
  await GetStorage.init();
  runApp( MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    final userdata = GetStorage();
    userdata.writeIfNull("islogged", false);
    Future.delayed(Duration.zero,() async{
      checkiflogged();
    });
  }

  @override
  Widget build(BuildContext context) {

    return GetMaterialApp(
      theme: ThemeData(
          colorScheme:
              ColorScheme.light().copyWith(primary: Colors.lightBlueAccent)),
      home: userdata.read("islogged")? bottomNav() : loginpage(),);

  }
}

void checkiflogged() {
  userdata.read("islogged") ? Get.offAll(bottomNav()) : Get.offAll(loginpage());
}
