import 'package:flutter/foundation.dart';
import 'package:hisapp/helpers/db_helper.dart';
import 'package:hisapp/models/Answer.dart';

class AnswerProvider extends ChangeNotifier {
  List<Answer> _answerList = [];

  List<Answer> get Answers {
    return [..._answerList];
  }

  Future<List<Answer>> getData(String idContent) async {
    final dataList =
        await DBHelper.getDataById('answer', idContent, 'id_content');
    _answerList = dataList
        .map((e) => Answer(
            id: e['id'],
            sentence: e['sentence'],
            id_question: e['id_question'],
            number: e['number']))
        .toList();
    return _answerList;
  }
}
