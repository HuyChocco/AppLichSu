import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hisapp/controllers/question_controller.dart';

import 'components/body.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuestionController _controller;
  @override
  void dispose() {
    Get.reset();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _controller = Get.put(QuestionController());
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        // Fluttter show the back button automatically
        backgroundColor: Colors.transparent,
        elevation: 0,
        actions: [
          TextButton(onPressed: _controller.nextQuestion, child: Text("Skip")),
        ],
      ),
      body: Body(),
    );
  }
}
