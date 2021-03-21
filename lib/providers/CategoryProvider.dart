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
            imagePath: e['imagePath'],
            number: e['number']))
        .toList();
  }

  Future<void> feedData() async {
    await DBHelper.insert('content_category', {
      'id': '1',
      'title': 'Sự kiện lịch sử',
      'number': 1,
      'imagePath': 'assets/images/marketing.png',
    });
    await DBHelper.insert('content_category', {
      'id': '2',
      'title': 'Anh hùng dân tộc',
      'number': 2,
      'imagePath': 'assets/images/marketing.png',
    });
    await DBHelper.insert('content_category', {
      'id': '3',
      'title': 'Các trận chiến',
      'number': 3,
      'imagePath': 'assets/images/marketing.png',
    });
    await DBHelper.insert('content_category', {
      'id': '4',
      'title': 'Quốc hiệu',
      'number': 4,
      'imagePath': 'assets/images/marketing.png',
    });
  }
}
