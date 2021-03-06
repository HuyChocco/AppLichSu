import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get/state_manager.dart';
import 'package:hisapp/helpers/db_helper.dart';
import 'package:hisapp/models/Answer.dart';
import 'package:hisapp/models/Questions.dart';
import 'package:hisapp/providers/AnswerProvider.dart';
import 'package:hisapp/providers/ContentProvider.dart';
import 'package:hisapp/providers/QuestionProvider.dart';
import 'package:hisapp/screens/quiz/score/score_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
//import 'package:hisapp/screens/score/score_screen.dart';

// We use get package for our state management

class QuestionController extends GetxController
    with SingleGetTickerProviderMixin {
  // Lets animated our progress bar
  //QuestionController({this._questions});

  AnimationController _animationController;
  Animation _animation;
  // so that we can access our animation outside
  Animation get animation => this._animation;

  PageController _pageController;
  PageController get pageController => this._pageController;

  List<Question> _questions;
  List<Question> get questions => this._questions;
  void set questions(ques) {
    this._questions = ques;
  }

  List<Answer> _answers;
  List<Answer> get answers => this._answers;

  bool _isAnswered = false;
  bool get isAnswered => this._isAnswered;

  int _correctAns;
  int get correctAns => this._correctAns;

  int _selectedAns;
  int get selectedAns => this._selectedAns;

  // for more about obs please check documentation
  RxInt _questionNumber = 1.obs;
  RxInt get questionNumber => this._questionNumber;

  int _numOfCorrectAns = 0;
  int get numOfCorrectAns => this._numOfCorrectAns;

  String _idContent;

  // called immediately after the widget is allocated memory
  @override
  void onInit() {
    // Our animation duration is 60 s
    // so our plan is to fill the progress bar within 60s
    _animationController =
        AnimationController(duration: Duration(seconds: 60), vsync: this);
    _animation = Tween<double>(begin: 0, end: 1).animate(_animationController)
      ..addListener(() {
        // update like setState
        update();
      });

    // start our animation
    // Once 60s is completed go to the next qn
    _animationController.forward().whenComplete(nextQuestion);
    _pageController = PageController();
    super.onInit();
  }

  // // called just before the Controller is deleted from memory
  @override
  void onClose() {
    _animationController.dispose();
    _pageController.dispose();
    super.onClose();
  }

  void checkAns(Question question, int selectedIndex, String idCate,
      BuildContext ctx) async {
    // because once user press any option then it will run
    _isAnswered = true;
    _correctAns = question.answerIndex;
    _selectedAns = selectedIndex;

    if (_correctAns == _selectedAns) _numOfCorrectAns++;

    // It will stop the counter
    _animationController.stop();
    update();
    _idContent = _questions[0].idContent;

    double _propotionOfRightAns = _numOfCorrectAns / questions?.length;

    if (_propotionOfRightAns >= 0.8) {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (prefs.containsKey('is_loaded')) prefs.remove('is_loaded');
      Provider.of<ContentProvider>(ctx, listen: false).updateData(_idContent);
    }
    Provider.of<ContentProvider>(ctx, listen: false)
        .getProportionOfDoneLecturesById(idCate);
    // Once user select an ans after 1s it will go to the next qn
    Future.delayed(Duration(seconds: 1), () {
      nextQuestion();
    });
  }

  void nextQuestion() {
    if (_questionNumber.value != _questions?.length) {
      _isAnswered = false;
      _pageController.nextPage(
          duration: Duration(milliseconds: 250), curve: Curves.ease);

      // Reset the counter
      _animationController.reset();

      // Then start it again
      // Once timer is finish go to the next qn
      _animationController.forward().whenComplete(nextQuestion);
    } else {
      // Get package provide us simple way to naviigate another page
      Get.off(() => ScoreScreen(_numOfCorrectAns));
    }
  }

  void updateTheQnNum(int index) {
    _questionNumber.value = index + 1;
  }
}
