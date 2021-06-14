import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:hisapp/controllers/question_controller.dart';

import '../../../constants.dart';

class ScoreScreen extends StatelessWidget {
  int _numberOfCorrectAns = 0;
  ScoreScreen(this._numberOfCorrectAns);
  @override
  Widget build(BuildContext context) {
    QuestionController _qnController = Get.put(QuestionController());
    return Scaffold(
      // appBar: AppBar(),
      body: Stack(
        fit: StackFit.expand,
        children: [
          //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
          Column(
            children: [
              Spacer(flex: 3),
              Text(
                "Điểm số",
                style: Theme.of(context).textTheme.headline3.copyWith(
                      color: kSecondaryColor,
                      fontFamily: 'Nunito',
                    ),
              ),
              Spacer(),
              Text(
                "${_qnController.questions != null ? _numberOfCorrectAns * 10 : 0}/${_qnController.questions != null ? _qnController.questions.length * 10 : 0}",
                style: Theme.of(context).textTheme.headline4.copyWith(
                      color: kSecondaryColor,
                      fontFamily: 'Nunito',
                    ),
              ),
              Spacer(flex: 3),
            ],
          )
        ],
      ),
    );
  }
}
