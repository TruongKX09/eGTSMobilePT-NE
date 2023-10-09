import 'package:egtspt/resources/profile_page.dart';
import 'package:egtspt/resources/pt_list_excercise_page.dart';

import 'package:egtspt/resources/schedule_page.dart';
import 'package:egtspt/resources/zego_chatinapp/zego_home_page.dart';

import 'package:flutter/material.dart';

import 'gymer_accept_page.dart';
import 'list_request_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;
  List<BottomNavigationBarItem> navItems = const [
    BottomNavigationBarItem(
      icon: Icon(Icons.person_add),
      label: 'Yêu cầu',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.create_sharp),
      label: 'DS Gymer',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.calendar_month_sharp),
      label: 'Lịch Tập',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.fitness_center_outlined),
      label: 'Bài Tập',
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
    const GymerAcceptPage(),
    const SchedulePage(),
    const PTExcercisePage(),
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
