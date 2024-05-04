import 'package:ecom_shop/ui/home/widget/account_page.dart';
import 'package:ecom_shop/ui/home/widget/chat_page.dart';
import 'package:ecom_shop/ui/home/widget/explore_page.dart';
import 'package:ecom_shop/ui/home/widget/home_page.dart';
import 'package:ecom_shop/ui/home/widget/purchased_page.dart';
import 'package:flutter/material.dart';

import '../../config/constatnts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  static const List<Widget> _pages = <Widget>[
    HomePage(),
    ExplorePage(),
    PurchasedPage(),
    ChatPage(),
    AccountPage(),
  ];

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _pages.elementAt(_selectedIndex), //New
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: AppConstatnts.MENU_HOME,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.public_rounded),
            label: AppConstatnts.MENU_EXPLORE,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.production_quantity_limits_rounded),
            label: AppConstatnts.MENU_PURCHASE,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat),
            label: AppConstatnts.MENU_Chat,
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle),
            label: AppConstatnts.MENU_Account,
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onSelectedPage,
      ),
    );
  }

  _onSelectedPage(int page) {
    setState(() {
      _selectedIndex = page;
    });
  }
}
