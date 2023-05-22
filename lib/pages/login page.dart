import 'package:deal_mart/Home/bottom.dart';
import 'package:deal_mart/signup/auth.dart';
import 'package:deal_mart/signup/controller.dart';
import 'package:deal_mart/signup/signuppage.dart';
import 'package:email_validator/email_validator.dart';
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

final controller = Get.put(Signupcontroller());
final otpController = Get.put(OTPController());
final _signkey = GlobalKey<FormState>();
final _auth = FirebaseAuth.instance;
final userdata = GetStorage();
bool passToggle = false;

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
                  key: _signkey,
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
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
                            const SizedBox(height: 20),

                            ///****************************** password **********************

                            TextFormField(
                                controller: controller.password,
                                decoration: InputDecoration(
                                  labelText: 'password',
                                  prefixIcon: Icon(Icons.lock),
                                  border: OutlineInputBorder(),
                                  filled: true,
                                  fillColor: Colors.blue.shade100,
                                  suffixIcon: InkWell(
                                      onTap: () {
                                        setState(() {
                                          passToggle = !passToggle;
                                        });
                                      },
                                      child: Icon(passToggle
                                          ? Icons.visibility_off
                                          : Icons.visibility)),
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
                                    return "make a strong password";
                                  }
                                  return null;
                                }),

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
                                  if (_signkey.currentState!.validate()) {
                                    try {
                                      final user = await _auth
                                          .signInWithEmailAndPassword(
                                              email:
                                                  controller.email.text.trim(),
                                              password: controller.password.text
                                                  .trim());

                                      if (user != null) {
                                        Get.off(bottomNav());
                                        userdata.write('islogged', true);
                                      }
                                    } catch (e) {
                                      String errorMessage = e.toString();
                                      Get.snackbar(
                                        'Sign-up Failed',
                                        errorMessage.substring(
                                            errorMessage.indexOf(']') + 1),
                                        snackPosition: SnackPosition.BOTTOM,
                                      );
                                    }
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
