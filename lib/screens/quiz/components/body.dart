import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hisapp/constants.dart';
import 'package:hisapp/controllers/question_controller.dart';
import 'package:hisapp/models/Questions.dart';
//import 'package:websafe_svg/websafe_svg.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'progress_bar.dart';
import 'question_card.dart';

class Body extends StatelessWidget {
  final String idCate;
  const Body({
    this.idCate,
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // So that we have acccess our controller
    QuestionController _questionController = Get.put(QuestionController());
    return Stack(
      fit: StackFit.expand,
      children: [
        //SvgPicture.asset("assets/icons/bg.svg", fit: BoxFit.fill),
        SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: ProgressBar(),
              ),
              SizedBox(height: kDefaultPadding),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Obx(
                  () => Text.rich(
                    TextSpan(
                      text:
                          "Câu hỏi ${_questionController.questionNumber.value}",
                      style: Theme.of(context).textTheme.headline4.copyWith(
                            color: kSecondaryColor,
                            fontFamily: 'Nunito',
                          ),
                      children: [
                        TextSpan(
                          text: "/${_questionController.questions.length}",
                          style: Theme.of(context).textTheme.headline5.copyWith(
                                color: kSecondaryColor,
                                fontFamily: 'Nunito',
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Divider(thickness: 1.5),
              SizedBox(height: kDefaultPadding),
              Expanded(
                child: PageView.builder(
                  // Block swipe to next qn
                  physics: NeverScrollableScrollPhysics(),
                  controller: _questionController.pageController,
                  onPageChanged: _questionController.updateTheQnNum,
                  itemCount: _questionController.questions.length,
                  itemBuilder: (context, index) => QuestionCard(
                    question: _questionController.questions[index],
                    idCate: idCate,
                  ),
                ),
              ),
            ],
          ),
        )
      ],
    );
  }
}
