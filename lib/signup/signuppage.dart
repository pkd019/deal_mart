import 'package:get/get.dart';

import 'controller.dart';
import 'package:flutter/material.dart';

class signup extends StatelessWidget {
  const signup({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(Signupcontroller());

    final _Key = GlobalKey();

    return Scaffold(
        body: Container(padding: EdgeInsets.symmetric(vertical: 60,horizontal: 20),
          child: Form(
      key: _Key,
      child: SingleChildScrollView(scrollDirection: Axis.vertical,
        child: Column(mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(height: 40,),
              TextFormField(

                controller: controller.name,
                decoration: InputDecoration(labelText: 'name',focusColor: Colors.black,hoverColor: Colors.black,
                    prefixIcon: Icon(Icons.person_outline_rounded),border: OutlineInputBorder(),filled: true,fillColor: Colors.blue.shade100),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.phone,
                decoration: InputDecoration(labelText: 'phone number',prefixIcon: Icon(Icons.call),border: OutlineInputBorder(),filled: true,fillColor: Colors.blue.shade100 ),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(validator: (value){},
                controller: controller.email,
                keyboardType: TextInputType.emailAddress,
                onChanged: (val){},
                decoration: InputDecoration(labelText: 'mail id ',prefixIcon: Icon(Icons.mail) ,border: OutlineInputBorder(),filled: true,fillColor: Colors.blue.shade100),
              ),
              SizedBox(
                height: 20,
              ),
              TextFormField(
                controller: controller.password,
                decoration: InputDecoration(labelText: 'password',prefixIcon: Icon(Icons.security) ,border: OutlineInputBorder(),filled: true,fillColor: Colors.blue.shade100),
             obscureText: true, ),
              SizedBox(
                height: 100,
              ),

              ElevatedButton(onPressed: (){}, child: Text('Sign in '),style: ButtonStyle(),)

            ],
        ),
      ),
    ),
        ));
  }
}
