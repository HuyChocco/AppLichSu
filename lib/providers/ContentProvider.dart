import 'package:flutter/material.dart';
import 'package:hisapp/providers/HisEventProvider.dart';
import 'package:hisapp/providers/CharacterProvider.dart';

class Content {
  final String title, link;
  bool isDone;

  Content({@required this.title, @required this.link, this.isDone = false});
}

class ContentProvider extends ChangeNotifier {
  String _title;
  List<Content> _list_content = [];
  String get Title {
    return _title;
  }

  List<Content> get Contents {
    return _list_content;
  }

  Future<void> setContentByCateId(String id) {
    switch (id) {
      case '1':
        {
          _title = "Sự kiện lịch sử";
          /*  final List<Content> loadedContents = [];
          HisEventProvider().Events.forEach((element) {
            loadedContents.add(Content(title: element.name, link: element.url));
          });
          _list_content = loadedContents; */
          _list_content = [];
        }
        break;
      case '2':
        {
          /*  _title = "Anh hùng dân tộc";
          final List<Content> loadedContents = [];
          CharacterProvider().Characters.forEach((element) {
            loadedContents
                .add(Content(title: element.name, link: element.link));
          });
          _list_content = loadedContents; */
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
