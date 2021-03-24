import 'package:flutter/material.dart';
import 'package:hisapp/helpers/db_helper.dart';
import 'package:flutter/services.dart' show rootBundle;

class Content {
  final String title, filePath, imagePath;
  int isDone;

  Content(
      {@required this.title,
      @required this.filePath,
      @required this.imagePath,
      @required this.isDone});
}

class ContentProvider extends ChangeNotifier {
  String _title;
  List<Content> _list_content = [];
  List<String> _list_main_content = [];
  String get Title {
    return _title;
  }

  List<Content> get Contents {
    return [..._list_content];
  }

  List<String> get MainContents {
    return [..._list_main_content];
  }

  Future<void> loadTextFromFile(String filePath) async {
    String _content = "";
    await rootBundle.loadString(filePath).then((value) => _content = value);
    if (_content.isNotEmpty) {
      _list_main_content = _content.split('\n');
    }
  }

  Future<void> setContentByCateId(String id) async {
    switch (id) {
      case '1':
        {
          _title = "Sự kiện lịch sử";
          final dataList = await DBHelper.getDataById('content', id);

          _list_content = dataList
              .map((e) => Content(
                  title: e['title'],
                  filePath: e['filePath'],
                  imagePath: e['imagePath'],
                  isDone: e['isDone']))
              .toList();
          print(_list_content[0].title);
        }
        break;
      case '2':
        {
          _title = "Anh hùng dân tộc";
          _list_content = [];
        }
        break;
      case '3':
        {
          _title = "Các trận chiến";
          _list_content = [];
        }
        break;
      case '4':
        {
          _title = "Quốc hiệu";
          _list_content = [];
        }
        break;
      default:
    }
  }
}
