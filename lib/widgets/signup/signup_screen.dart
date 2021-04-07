import 'package:flutter/material.dart';

import 'components/body.dart';

class SignUpScreen extends StatelessWidget {
  PageController _pageController;
  SignUpScreen(this._pageController);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(_pageController),
    );
  }
}
