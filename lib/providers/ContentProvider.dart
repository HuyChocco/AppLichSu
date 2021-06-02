import 'package:flutter/material.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:hisapp/helpers/db_helper.dart';
import 'package:flutter/services.dart' show rootBundle;

class Content {
  final String id, title, idCate, time, filePath, imagePath, videoPath, keyWord;
  int isDone;

  Content(
      {@required this.id,
      @required this.idCate,
      @required this.title,
      @required this.time,
      @required this.filePath,
      @required this.imagePath,
      @required this.videoPath,
      @required this.isDone,
      @required this.keyWord});
}

class ContentProvider extends ChangeNotifier {
  String _title;
  List<Content> _listContent = [];
  List<String> _listMainContent = [];

  String get Title {
    return _title;
  }

  List<Content> get Contents {
    return [..._listContent];
  }

  List<String> get MainContents {
    return [..._listMainContent];
  }

  Future<void> loadTextFromFile(String filePath) async {
    String _content = "";
    await rootBundle.loadString(filePath).then((value) => _content = value);
    if (_content.isNotEmpty) {
      _listMainContent = _content.split('\n');
    }
  }

  Future<void> setContentByCateId(String id) async {
    switch (id) {
      case '1':
        {
          final dataList =
              await DBHelper.getDataById('content', id, 'id_category');

          _listContent = dataList
              .map((e) => Content(
                  id: e['id'],
                  idCate: e['id_category'],
                  time: e['time'],
                  title: e['title'],
                  filePath: e['file_path'],
                  imagePath: e['image_path'],
                  videoPath: e['video_path'],
                  isDone: e['is_done'],
                  keyWord: e['key_word']))
              .toList();
        }
        break;
      case '2':
        {
          final dataList =
              await DBHelper.getDataById('content', id, 'id_category');

          _listContent = dataList
              .map((e) => Content(
                  id: e['id'],
                  idCate: e['id_category'],
                  title: e['title'],
                  time: e['time'],
                  filePath: e['file_path'],
                  imagePath: e['image_path'],
                  videoPath: e['video_path'],
                  isDone: e['is_done'],
                  keyWord: e['key_word']))
              .toList();
        }
        break;
      case '3':
        {
          final dataList =
              await DBHelper.getDataById('content', id, 'id_category');

          _listContent = dataList
              .map((e) => Content(
                  id: e['id'],
                  idCate: e['id_category'],
                  title: e['title'],
                  time: e['time'],
                  filePath: e['file_path'],
                  imagePath: e['image_path'],
                  videoPath: e['video_path'],
                  isDone: e['is_done'],
                  keyWord: e['key_word']))
              .toList();
        }
        break;
      case '4':
        {
          final dataList =
              await DBHelper.getDataById('content', id, 'id_category');

          _listContent = dataList
              .map((e) => Content(
                  id: e['id'],
                  idCate: e['id_category'],
                  title: e['title'],
                  time: e['time'],
                  filePath: e['file_path'],
                  imagePath: e['image_path'],
                  videoPath: e['video_path'],
                  isDone: e['is_done'],
                  keyWord: e['key_word']))
              .toList();
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
          _listContent.firstWhere((element) => element.id == idContent);
      int index = _listContent.indexOf(content);
      _listContent[index].isDone = 1;
      notifyListeners();
    } catch (ex) {
      print(ex.toString());
    }
  }

  Future<void> getProportionOfDoneLecturesById(String _idCate) async {
    final dataList =
        await DBHelper.getDataById('content', _idCate, 'id_category');
    final contentlist = dataList
        .map((e) => Content(
            id: e['id'],
            idCate: e['id_category'],
            title: e['title'],
            time: e['time'],
            filePath: e['file_path'],
            imagePath: e['image_path'],
            videoPath: e['video_path'],
            isDone: e['is_done'],
            keyWord: e['key_word']))
        .toList();
    final doneContentList = contentlist.where((element) => element.isDone == 1);
    _rate = doneContentList.length / contentlist.length;
    notifyListeners();
  }

  Future<List<Content>> loadAllContentForSearching() async {
    final dataList = await DBHelper.getData('content');
    List<Content> listSearchContent = dataList
        .map((e) => Content(
            id: e['id'],
            idCate: e['id_category'],
            title: e['title'],
            time: e['time'],
            filePath: e['file_path'],
            imagePath: e['image_path'],
            videoPath: e['video_path'],
            isDone: e['is_done'],
            keyWord: e['key_word']))
        .toList();
    return listSearchContent;
  }
}
