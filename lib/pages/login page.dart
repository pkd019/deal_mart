import 'package:deal_mart/Home/bottom.dart';
import 'package:deal_mart/signup/auth.dart';
import 'package:deal_mart/signup/controller.dart';
import 'package:deal_mart/signup/signuppage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

///login page
class loginpage extends StatefulWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  State<loginpage> createState() => _loginpageState();
}
/// AL CONTROLLERR NEEDED FOR TEXTFORMFILLED AND VERIFICATION*******************************************8

final controller = Get.put(Signupcontroller());
final otpController = Get.put(OTPController());
final _formkey = GlobalKey<FormState>();
final _auth = FirebaseAuth.instance;
final userdata = GetStorage();

class _loginpageState extends State<loginpage> {
  @override
  Widget build(BuildContext context) {
    userdata.write('islogged', false);
    return Scaffold(
        appBar: AppBar(title: Text('login page')),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              child: Form(
                  key: _formkey,
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              controller: controller.email,
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.mail),
                                  labelText: 'Email',
                                  hintText: 'Email',
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              controller: controller.password,
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.security),
                                labelText: 'Password',
                                hintText: 'Password',
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: null,
                                  icon: Icon(
                                    Icons.remove_red_eye_sharp,
                                  ),
                                ),
                              ),
                              obscureText: true,
                            ),
                            const SizedBox(height: 20),
                            Align(
                              alignment: Alignment.centerRight,
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text("ForgetPassword")),
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: ElevatedButton(
                                onPressed: () async {
                                  final user =
                                      await _auth.signInWithEmailAndPassword(
                                          email: controller.email.text.trim(),
                                          password:
                                              controller.password.text.trim());

                                  if (user != null) {
                                    Get.off(bottomNav());
                                    userdata.write('islogged', true);
                                  }
                                },
                                child: Text('log in'),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(child: Text('Or')),
                            SizedBox(
                              height: 20,
                            ),
                            SizedBox(
                              width: double.infinity,
                              child: OutlinedButton.icon(
                                icon: Icon(Icons.browse_gallery),
                                onPressed: () {
                                  googleSignIn();

                                  Get.off(bottomNav());
                                  userdata.write('islogged', true);
                                },
                                label: Text("Sign in with google"),
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Center(
                              child: TextButton(
                                  onPressed: () {
                                    Get.to(signup());
                                  },
                                  child: Text.rich(
                                    TextSpan(
                                      text: 'Dont HaveAn Account ?',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                      children: const [
                                        TextSpan(
                                            text: 'Signup',
                                            style:
                                                TextStyle(color: Colors.blue))
                                      ],
                                    ),
                                  )),
                            )
                          ])))),
        ));
  }
}
