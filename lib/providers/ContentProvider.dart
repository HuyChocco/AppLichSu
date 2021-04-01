import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hisapp/helpers/db_helper.dart';
import 'package:flutter/services.dart' show rootBundle;

class Content {
  final String id, title, idCate, filePath, imagePath, videoPath;
  int isDone;

  Content(
      {@required this.id,
      @required this.idCate,
      @required this.title,
      @required this.filePath,
      @required this.imagePath,
      @required this.videoPath,
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
          final dataList =
              await DBHelper.getDataById('content', id, 'id_category');

          _list_content = dataList
              .map((e) => Content(
                  id: e['id'],
                  idCate: e['id_category'],
                  title: e['title'],
                  filePath: e['file_path'],
                  imagePath: e['image_path'],
                  videoPath: e['video_path'],
                  isDone: e['is_done']))
              .toList();
        }
        break;
      case '2':
        {
          //_title = "Anh hùng dân tộc";
          _list_content = [];
        }
        break;
      case '3':
        {
          //_title = "Các trận chiến";
          _list_content = [];
        }
        break;
      case '4':
        {
          //_title = "Quốc hiệu";
          _list_content = [];
        }
        break;
      default:
    }
    getProportionOfDoneLecturesById(id);
  }

  double _rate = 0;
  double get rate {
    return _rate;
  }

  Future<void> updateData(String idContent) async {
    try {
      await DBHelper.updateData('content', {'is_done': 1}, idContent, 'id');
      Content content =
          _list_content.firstWhere((element) => element.id == idContent);
      int index = _list_content.indexOf(content);
      _list_content[index].isDone = 1;
      notifyListeners();
    } catch (ex) {
      print(ex.toString());
    }
  }

  void getProportionOfDoneLecturesById(String _idCate) async {
    final dataList =
        await DBHelper.getDataById('content', _idCate, 'id_category');
    final contentlist = dataList
        .map((e) => Content(
            id: e['id'],
            idCate: e['id_category'],
            title: e['title'],
            filePath: e['file_path'],
            imagePath: e['image_path'],
            videoPath: e['video_path'],
            isDone: e['is_done']))
        .toList();
    final doneContentList = contentlist.where((element) => element.isDone == 1);
    _rate = doneContentList.length / contentlist.length;
    notifyListeners();
  }
}
