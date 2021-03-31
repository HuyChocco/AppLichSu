import 'package:flutter/foundation.dart';
import 'package:hisapp/helpers/db_helper.dart';
import 'package:hisapp/models/Answer.dart';

class AnswerProvider extends ChangeNotifier {
  List<Answer> _list_answer = [];

  List<Answer> get Answers {
    return [..._list_answer];
  }

  Future<List<Answer>> getData(String id_content) async {
    final dataList =
        await DBHelper.getDataById('answer', id_content, 'id_content');
    _list_answer = dataList
        .map((e) => Answer(
            id: e['id'],
            sentence: e['sentence'],
            id_question: e['id_question'],
            number: e['number']))
        .toList();
    return _list_answer;
  }
}
