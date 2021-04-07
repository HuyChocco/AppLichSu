import 'package:flutter/material.dart';

import 'components/body.dart';

class LoginScreen extends StatelessWidget {
  PageController _pageController;
  LoginScreen(this._pageController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(_pageController),
    );
  }
}
