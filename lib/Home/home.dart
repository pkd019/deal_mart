import 'package:deal_mart/Home/bottom.dart';
import 'package:flutter/material.dart';

class home extends StatelessWidget {
  const home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(title: Text('home'),),

      drawer: Drawer(),
      body: Container()
    );
  }
}
