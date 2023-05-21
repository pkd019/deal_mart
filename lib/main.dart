import 'package:deal_mart/Home/bottom.dart';
import 'package:deal_mart/pages/login%20page.dart';
import 'package:deal_mart/signup/signuppage.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:flutter/material.dart';

import 'Home/home.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          colorScheme:
              ColorScheme.light().copyWith(primary: Colors.lightBlueAccent)),
      home: signup(),
    );
  }
}
