import 'package:flutter/foundation.dart';
import 'package:hisapp/helpers/db_helper.dart';
import 'package:hisapp/models/Answer.dart';
import 'package:hisapp/models/Questions.dart';

class QuestionProvider extends ChangeNotifier {
  List<Question> _list_question = [];
  List<Answer> _list_answer = [];

  List<Question> get Questions {
    return [..._list_question];
  }

  Future<List<Question>> getData(String id_content) async {
    final dataQuestionList =
        await DBHelper.getDataById('question', id_content, 'id_content');

    _list_question = dataQuestionList
        .map((e) => Question(
              id: e['id'],
              sentence: e['sentence'],
              idContent: e['id_content'],
              number: e['number'],
              answerIndex: e['answer_index'],
            ))
        .toList();
    final dataAnswerList =
        await DBHelper.getDataById('answer', id_content, 'id_content');
    _list_answer = dataAnswerList
        .map((e) => Answer(
            id: e['id'],
            sentence: e['sentence'],
            id_question: e['id_question'],
            number: e['number']))
        .toList();
    if (_list_question.length > 0 && _list_answer.length > 0) {
      _list_question.forEach((elem) {
        List<String> options = _list_answer
            .where((val) => val.id_question == elem.id)
            .map((e) => e.sentence)
            .toList();
        elem.options = options;
      });
    }
    return _list_question;
  }
}
