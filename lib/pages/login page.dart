import 'package:deal_mart/signup/signuppage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

//login page
class loginpage extends StatelessWidget {
  const loginpage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('login page')),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Container(
              child: Form(
                  child: Container(
                      padding: EdgeInsets.symmetric(vertical: 20),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextFormField(
                              decoration: const InputDecoration(
                                  prefixIcon:
                                      Icon(Icons.person_outline_outlined),
                                  labelText: 'Email',
                                  hintText: 'Email',
                                  border: OutlineInputBorder()),
                            ),
                            const SizedBox(height: 20),
                            TextFormField(
                              decoration: const InputDecoration(
                                prefixIcon: Icon(Icons.fingerprint),
                                labelText: 'Password',
                                hintText: 'Password',
                                border: OutlineInputBorder(),
                                suffixIcon: IconButton(
                                  onPressed: null,
                                  icon: Icon(Icons.remove_red_eye_sharp),
                                ),
                              ),
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
                                onPressed: () {},
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
                                onPressed: () {},
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
