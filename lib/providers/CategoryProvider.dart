import 'package:flutter/foundation.dart';
import 'package:hisapp/models/Category.dart' as cate;
import 'package:hisapp/helpers/db_helper.dart';

class CategoryProvider extends ChangeNotifier {
  List<cate.Category> _list_category = [];

  List<cate.Category> get Categories {
    return [..._list_category];
  }

  Future<void> getData() async {
    final dataList = await DBHelper.getData('content_category');
    _list_category = dataList
        .map((e) => cate.Category(
            id: e['id'],
            title: e['title'],
            imagePath: e['image_path'],
            number: e['number']))
        .toList();
    notifyListeners();
  }
}
