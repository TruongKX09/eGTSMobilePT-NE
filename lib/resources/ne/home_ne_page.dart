import 'package:egtspt/resources/ne/v2_home_food_list_page.dart';
import 'package:egtspt/resources/profile_page.dart';

import 'package:flutter/material.dart';

import '../list_request_page.dart';

import '../zego_chatinapp/zego_home_page.dart';
import 'gymer_accept_ne_page.dart';

class HomeNEPage extends StatefulWidget {
  const HomeNEPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomeNEPageState();
}

class _HomeNEPageState extends State<HomeNEPage> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> navItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.person_add),
      label: 'Yêu cầu',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month_sharp),
      label: 'DS Gymer',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.food_bank_outlined),
      label: 'Thực Phẩm',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.chat_outlined),
      label: 'Tin Nhắn',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.person),
      label: 'Hồ sơ',
    ),
  ];

  List<Widget> tabs = [
    const ListRequestPage(),
    const GymerAcceptNEPage(),
    const V2HomeFoodListPage(),
    const HomePageZego(),
    const ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: tabs[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: navItems,
        currentIndex: _selectedIndex,
        onTap: (int index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        backgroundColor: const Color(0xffcbb682),
        elevation: 0,
        selectedItemColor: const Color(0xffcbb682),
        unselectedItemColor: Colors.black,
      ),
    );
  }
}
