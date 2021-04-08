import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hisapp/widgets/components/already_have_an_account_acheck.dart';
import 'package:hisapp/widgets/components/rounded_button.dart';
import 'package:hisapp/widgets/components/rounded_input_field.dart';
import 'package:hisapp/widgets/components/rounded_password_field.dart';
import 'package:hisapp/widgets/login/login_screen.dart';
import 'package:hisapp/widgets/signup/components/or_divider.dart';
import 'package:hisapp/widgets/signup/components/social_icon.dart';

import 'background.dart';

class Body extends StatefulWidget {
  PageController _pageController;
  Body(this._pageController);

  @override
  _BodyState createState() => _BodyState();
}

class _BodyState extends State<Body> {
  final _auth = FirebaseAuth.instance;
  var _isLoading = false;
  var _userEmail = '';
  var _userName = '';
  var _userPassword = '';
  void _submitForm() async {
    UserCredential authResult;
    try {
      setState(() {
        _isLoading = true;
      });
      authResult = await _auth.createUserWithEmailAndPassword(
        email: _userEmail,
        password: _userPassword,
      );
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authResult.user.uid)
          .set({
        'username': _userName,
        'email': _userEmail,
        //'image_url': url,
      });
      setState(() {
        _isLoading = false;
      });
      Navigator.of(context).pop();
    } catch (err) {
      print(err);
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            /* Text(
              "ĐĂNG KÝ",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ), */
            RoundedInputField(
              hintText: "Tên của bạn",
              onChanged: (value) {
                _userName = value.trim();
              },
            ),
            RoundedInputField(
              hintText: "Email",
              onChanged: (value) {
                _userEmail = value.trim();
              },
            ),
            RoundedPasswordField(
              onChanged: (value) {
                _userPassword = value.trim();
              },
            ),
            if (_isLoading) CircularProgressIndicator(),
            if (!_isLoading)
              RoundedButton(
                text: "ĐĂNG KÝ",
                press: () {
                  _submitForm();
                },
              ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              login: false,
              press: () {
                widget._pageController.previousPage(
                    duration: Duration(milliseconds: 250), curve: Curves.ease);
              },
            ),
            OrDivider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SocalIcon(
                  iconSrc: "assets/icons/facebook.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/twitter.svg",
                  press: () {},
                ),
                SocalIcon(
                  iconSrc: "assets/icons/google-plus.svg",
                  press: () {},
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
