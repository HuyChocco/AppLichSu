import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hisapp/widgets/components/already_have_an_account_acheck.dart';
import 'package:hisapp/widgets/components/rounded_button.dart';
import 'package:hisapp/widgets/components/rounded_input_field.dart';
import 'package:hisapp/widgets/components/rounded_password_field.dart';
import 'package:hisapp/widgets/login/components/background.dart';
import 'package:hisapp/widgets/signup/signup_screen.dart';

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
      authResult = await _auth.signInWithEmailAndPassword(
        email: _userEmail,
        password: _userPassword,
      );
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
              "LOGIN",
              style: TextStyle(fontWeight: FontWeight.bold),
            ), */
            //SizedBox(height: size.height * 0.03),
            /* SvgPicture.asset(
              "assets/icons/login.svg",
              height: size.height * 0.35,
            ), */
            SizedBox(height: size.height * 0.03),
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
                text: "ĐĂNG NHẬP",
                press: () {
                  _submitForm();
                },
              ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                widget._pageController.nextPage(
                    duration: Duration(milliseconds: 250), curve: Curves.ease);
              },
            ),
          ],
        ),
      ),
    );
  }
}
