import 'package:flutter/material.dart';
import 'package:hisapp/components/app_bar.dart';
import 'package:hisapp/components/custom_bottom_nav_bar.dart';
import './components/body.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: buildAppBar(context, isTransparent: true),
      body: Body(),
      bottomNavigationBar: CustomBottonNavBar(),
    );
  }
}
