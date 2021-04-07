import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hisapp/widgets/components/already_have_an_account_acheck.dart';
import 'package:hisapp/widgets/components/rounded_button.dart';
import 'package:hisapp/widgets/components/rounded_input_field.dart';
import 'package:hisapp/widgets/components/rounded_password_field.dart';
import 'package:hisapp/widgets/login/components/background.dart';
import 'package:hisapp/widgets/signup/signup_screen.dart';

class Body extends StatelessWidget {
  PageController _pageController;
  Body(this._pageController);
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
              onChanged: (value) {},
            ),
            RoundedPasswordField(
              onChanged: (value) {},
            ),
            RoundedButton(
              text: "ĐĂNG NHẬP",
              press: () {},
            ),
            SizedBox(height: size.height * 0.03),
            AlreadyHaveAnAccountCheck(
              press: () {
                _pageController.nextPage(
                    duration: Duration(milliseconds: 250), curve: Curves.ease);
              },
            ),
          ],
        ),
      ),
    );
  }
}
