import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hisapp/screens/splash_screen.dart';
import 'package:hisapp/widgets/login/login_screen.dart';
import 'package:hisapp/widgets/signup/signup_screen.dart';

import '../../constants.dart';

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

  void _showBottomForm() async {
    showModalBottomSheet(
        isDismissible: true, context: context, builder: (ctx) => Container());
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
                              decoration: BoxDecoration(
                                gradient: kPrimaryGradient,
                              ),
                              width: double.infinity,
                              child: Column(
                                //mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(height: 10),
                                  Text(
                                    "Nhận đáp án miễn phí cho câu hỏi của bạn",
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline5
                                        .copyWith(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                  ),
                                  ElevatedButton(
                                    onPressed: _logOut,
                                    child: Text("Đăng xuất"),
                                  ),
                                  ElevatedButton(
                                    onPressed: _showBottomForm,
                                    child: Text("Đăng câu hỏi"),
                                  ),
                                  SizedBox(height: 20),
                                  Expanded(
                                    child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.9),
                                          borderRadius: BorderRadius.only(
                                            topLeft: Radius.circular(60),
                                            topRight: Radius.circular(60),
                                          ),
                                        ),
                                        child: Column(children: [
                                          SizedBox(
                                            height: 80,
                                          ),
                                          Expanded(
                                            child: ListView.builder(
                                                itemCount: 10,
                                                itemBuilder: (_, index) => Card(
                                                      child: Column(
                                                        children: [
                                                          ListTile(
                                                            /* shape: RoundedRectangleBorder(
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)), */
                                                            leading:
                                                                CircleAvatar(
                                                              backgroundImage:
                                                                  NetworkImage(
                                                                      "https://firebasestorage.googleapis.com/v0/b/history-app-9a233.appspot.com/o/user_image%2FeIDR0cM73AVc9eJOElBNpAPdrZl1.jpg?alt=media&token=f9b7d600-ad1b-4004-b0c1-8bd4009337db"),
                                                            ),
                                                            title:
                                                                Text("Hello!"),
                                                            subtitle: Text(
                                                                "08-04-2021 16:10"),
                                                          ),
                                                          Text(
                                                              "Lê Lợi quê quán ở đâu?"),
                                                          Row(
                                                            children: [
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon: Icon(Icons
                                                                      .favorite_border)),
                                                              Text('0'),
                                                              IconButton(
                                                                  onPressed:
                                                                      () {},
                                                                  icon: Icon(Icons
                                                                      .chat_outlined)),
                                                              Text('0'),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    )),
                                          ),
                                        ])),
                                  )
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
