import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hisapp/constants.dart';
import 'package:hisapp/helpers/seed_data.dart';
import 'package:hisapp/providers/CategoryProvider.dart';
import 'package:hisapp/screens/home/home_screen.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  final _textFieldController = TextEditingController();
  final _texFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
  }

  @protected
  @mustCallSuper
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    _texFocusNode.dispose();
    _textFieldController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Spacer(flex: 2), //2/6
                  Text(
                    "Xin chào bạn,",
                    style: Theme.of(context).textTheme.headline4.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Nunito',
                        ),
                  ),
                  Text(
                    "Nhập tên bạn dưới đây",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Nunito',
                    ),
                  ),
                  Spacer(), // 1/6
                  TextField(
                    style: TextStyle(color: Colors.white),
                    focusNode: _texFocusNode,
                    //onSubmitted: (val) {},
                    controller: _textFieldController,
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Color(0xFF1C2341),
                      hintText: "Tên của bạn",
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                    ),
                  ),
                  Spacer(), // 1/6
                  GestureDetector(
                    onTap: () async {
                      if (_textFieldController.text.trim().isEmpty) return;
                      SharedPreferences prefs =
                          await SharedPreferences.getInstance();
                      await prefs.setString(
                          'user_name', _textFieldController.text.trim());
                      /*  await Provider.of<CategoryProvider>(context,
                              listen: false)
                          .feedData(); */
                      await SeedData.insertContentCategory();
                      await SeedData.insertContentTKLS();
                      await SeedData.insertContentAHDT();
                      await SeedData.insertContentTD();
                      await SeedData.insertContentQH();
                      await SeedData.insertQuestion();
                      await SeedData.insertAnswer();
                      Navigator.of(context)
                          .pushReplacementNamed('/home-screen');
                    },
                    child: Container(
                      width: double.infinity,
                      alignment: Alignment.center,
                      padding: EdgeInsets.all(kDefaultPadding * 0.75), // 15
                      decoration: BoxDecoration(
                        gradient: kPrimaryGradient,
                        borderRadius: BorderRadius.all(Radius.circular(12)),
                      ),
                      child: Text(
                        "Bắt đầu ngay nào",
                        style: Theme.of(context).textTheme.button.copyWith(
                              color: Colors.black,
                              fontFamily: 'Nunito',
                            ),
                      ),
                    ),
                  ),
                  Spacer(flex: 2), // it will take 2/6 spaces
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
