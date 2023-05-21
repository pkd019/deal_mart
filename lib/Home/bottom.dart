import 'package:deal_mart/Home/home.dart';
import 'package:deal_mart/pages/cart.dart';
import 'package:deal_mart/pages/likes.dart';
import 'package:deal_mart/pages/login%20page.dart';
import 'package:deal_mart/pages/profile.dart';
import 'package:flutter/material.dart';
class bottomNav extends StatefulWidget {

  @override
  State<bottomNav> createState() => _bottomNavState();
}

class _bottomNavState extends State<bottomNav> {
  int selectedindex = 0;
  PageController pageController = PageController();

  void onItemTapped(int index){
    setState(() {
      selectedindex = index;
      pageController.jumpToPage(index);
    });

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:PageView(
        controller: pageController,
        children: [
          home(),
          likes(),
          cart(),
          profile(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(items:
      const <BottomNavigationBarItem>
      [BottomNavigationBarItem(icon: Icon(Icons.home),label:'home'),
        BottomNavigationBarItem(icon: Icon(Icons.favorite_border),label:'likes'),
        BottomNavigationBarItem(icon: Icon(Icons.shopping_cart),label:'cart'),
        BottomNavigationBarItem(icon: Icon(Icons.person),label:'profile')],
        currentIndex: selectedindex,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.grey,
        onTap: onItemTapped,
      ),

    );

  }
}