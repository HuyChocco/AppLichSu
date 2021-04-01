import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hisapp/controllers/question_controller.dart';
import 'package:hisapp/models/Answer.dart';
import 'package:hisapp/models/Questions.dart';
import 'package:hisapp/providers/AnswerProvider.dart';
import 'package:hisapp/providers/QuestionProvider.dart';
import 'package:provider/provider.dart';

import 'components/body.dart';

class QuizScreen extends StatefulWidget {
  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  QuestionController _controller;
  List<Question> _questions;
  String idContent;
  bool init = false;

  @override
  void initState() {
    super.initState();
  }

  void getData() async {}
  @override
  void dispose() {
    Get.reset();
    super.dispose();
  }

  @override
  void didChangeDependencies() async {
    if (!init) {
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      idContent = routeArgs['idContent'];
      print('idContent $idContent');
    }
    init = true;
    super.didChangeDependencies();
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
      body: FutureBuilder(
          future: Provider.of<QuestionProvider>(context, listen: false)
              .getData(idContent),
          builder: (ctx, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              _controller.questions = snapshot.data;
              return Body();
            } else
              return Center(
                child: CircularProgressIndicator(),
              );
          }),
    );
  }
}
