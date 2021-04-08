import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hisapp/screens/splash_screen.dart';
import 'package:hisapp/widgets/login/login_screen.dart';
import 'package:hisapp/widgets/signup/signup_screen.dart';

class DiscussionScreen extends StatefulWidget {
  @override
  _DiscussionScreenState createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  bool _isLogin = false;

  var _pageViewController = PageController();
  void _logOut() async {
    final _auth = FirebaseAuth.instance;
    await _auth.signOut();
  }

  void _showBottomSheetDialog() {
    if (!_isLogin)
      showModalBottomSheet(
          isDismissible: true,
          context: context,
          builder: (ctx) => PageView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (_, index) => index == 0
                    ? LoginScreen(_pageViewController)
                    : SignUpScreen(_pageViewController),
                itemCount: 2,
                controller: _pageViewController,
              ));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final Future<FirebaseApp> _initialization = Firebase.initializeApp();

    return FutureBuilder(
        future: _initialization,
        builder: (context, appSnapshot) {
          return SafeArea(
            child: Scaffold(
              body: appSnapshot.connectionState != ConnectionState.done
                  ? SplashScreen()
                  : StreamBuilder(
                      stream: FirebaseAuth.instance.authStateChanges(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return Container(
                              width: double.infinity,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  ElevatedButton(
                                    onPressed: _logOut,
                                    child: Text("Đăng xuất"),
                                  ),
                                ],
                              ));
                        }
                        return Container(
                          width: double.infinity,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text("Bạn chưa đăng nhập"),
                              ElevatedButton(
                                onPressed: _showBottomSheetDialog,
                                child: Text("Đăng nhập"),
                              ),
                            ],
                          ),
                        );
                      }),
            ),
          );
        });
  }
}
