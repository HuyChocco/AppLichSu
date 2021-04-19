import 'package:flutter/material.dart';
import 'package:hisapp/screens/alarm/alarm_page.dart';
import 'package:hisapp/screens/alarm/clock_page.dart';
import 'package:hisapp/screens/dashboard/dashboard_screen.dart';
import 'package:hisapp/screens/discussion/discussion_screen.dart';
import 'package:hisapp/screens/settings/setting_screen.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<Map<String, Object>> _pages = [
    {'page': DashboardScreen()},
    {'page': DiscussionScreen()},
    {'page': AlarmPage()},
    {'page': SettingScreen()},
  ];

  int _selectedPageIndex = 0;
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.dashboard), label: "Trang chủ"),
          BottomNavigationBarItem(icon: Icon(Icons.chat), label: "Thảo luận"),
          BottomNavigationBarItem(icon: Icon(Icons.alarm), label: "Nhắc nhở"),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: "Khác")
        ],
        onTap: _selectPage,
        currentIndex: _selectedPageIndex,
        //type: BottomNavigationBarType.shifting,
        selectedItemColor: Colors.blue,
        unselectedItemColor: Colors.black,
        //unselectedLabelStyle: TextStyle(color: Colors.black),
      ),
      body: _pages[_selectedPageIndex]['page'],
    );
  }
}
