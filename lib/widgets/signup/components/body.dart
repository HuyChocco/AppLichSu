import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hisapp/widgets/components/already_have_an_account_acheck.dart';
import 'package:hisapp/widgets/components/rounded_button.dart';
import 'package:hisapp/widgets/components/rounded_input_field.dart';
import 'package:hisapp/widgets/components/rounded_password_field.dart';
import 'package:hisapp/widgets/login/login_screen.dart';
import 'package:hisapp/widgets/pickers/user_image_picker.dart';
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
  File _userImageFile;

  void _pickedImage(File image) {
    _userImageFile = image;
  }

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
      final ref = FirebaseStorage.instance
          .ref()
          .child('user_image')
          .child(authResult.user.uid + '.jpg');

      await ref.putFile(_userImageFile);

      final url = await ref.getDownloadURL();
      await FirebaseFirestore.instance
          .collection('users')
          .doc(authResult.user.uid)
          .set({
        'username': _userName,
        'email': _userEmail,
        'image_url': url,
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
              "????NG K??",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            SizedBox(height: size.height * 0.03),
            SvgPicture.asset(
              "assets/icons/signup.svg",
              height: size.height * 0.35,
            ), */
            UserImagePicker(_pickedImage),
            RoundedInputField(
              hintText: "T??n c???a b???n",
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
                text: "????NG K??",
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
