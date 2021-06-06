import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../constants.dart';

class SettingScreen extends StatefulWidget {
  @override
  _SettingScreenState createState() => _SettingScreenState();
}

class _SettingScreenState extends State<SettingScreen> {
  void _logOut() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    if (prefs.containsKey('is_loaded')) prefs.remove('is_loaded');
    if (prefs.containsKey("user_name")) {
      prefs.remove('user_name');
      Navigator.of(context).pushReplacementNamed('/welcome-screen');
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      //child: Container(
      //  color: Colors.red,
      //alignment: Alignment.center,
      child: Column(
        children: [
          GestureDetector(
            onTap: _logOut,
            child: Container(
              margin: EdgeInsets.only(
                top: 40,
              ),
              color: Colors.grey,
              alignment: Alignment.center,
              padding: EdgeInsets.all(kDefaultPadding * 0.75),
              child: Text(
                "Đăng xuất",
                style: Theme.of(context).textTheme.button.copyWith(
                      color: Colors.black,
                      fontFamily: 'Nunito',
                    ),
              ),
            ),
          ),
        ],
      ),
      //  ),
    );
  }
}
