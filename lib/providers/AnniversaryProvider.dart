import 'package:flutter/foundation.dart';
import 'package:hisapp/helpers/db_helper.dart';
import 'package:hisapp/models/Anniversary.dart';

class AnniversaryProvider extends ChangeNotifier {
  List<Anniversary> _anniversaryList = [];

  List<Anniversary> get anniversaryList {
    return [..._anniversaryList];
  }

  Future<void> getAllData() async {
    final dataList = await DBHelper.getData('anniversary');
    _anniversaryList = dataList
        .map((e) => Anniversary(
            id: e['id'],
            day: e['day'],
            month: e['month'],
            year: e['year'],
            content: e['content']))
        .toList();
  }
}
