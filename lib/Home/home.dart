
import 'package:deal_mart/pages/login%20page.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';




class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(actions:
        [Padding(padding: EdgeInsets.only(right: 20),child: GestureDetector(onTap: ()async{Get.off(loginpage());
        userdata.write("islogged", false);},child: Icon(Icons.logout,size: 26.0,),),)],
          title: Text('home'),
        ),
        drawer: Drawer(),
        body: Container(
        ));}
}
