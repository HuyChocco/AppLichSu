import 'package:flutter/material.dart';
import 'package:hisapp/widgets/login/login_screen.dart';

class DiscussionScreen extends StatefulWidget {
  @override
  _DiscussionScreenState createState() => _DiscussionScreenState();
}

class _DiscussionScreenState extends State<DiscussionScreen> {
  bool _isLogin = false;
  void _showBottomSheetDialog() {
    if (!_isLogin)
      showModalBottomSheet(
          isDismissible: true,
          context: context,
          builder: (ctx) => LoginScreen());
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
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
        ),
      ),
    );
  }
}
