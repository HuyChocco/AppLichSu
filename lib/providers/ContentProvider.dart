import 'package:flutter/material.dart';
import "package:hisapp/models/HisEvent.dart";
import "package:hisapp/models/Character.dart";
import 'package:hisapp/constants.dart';
import 'package:hisapp/providers/HisEventProvider.dart';
import 'package:hisapp/providers/character_provider.dart';

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

  Future<void> setContentByCateId(Categories id) {
    switch (id) {
      case Categories.HistoryEvent:
        {
          _title = "Sự kiện lịch sử";
          final List<Content> loadedContents = [];
          HisEventProvider().Events.forEach((element) {
            loadedContents.add(Content(title: element.name, link: element.url));
          });
          _list_content = loadedContents;
        }
        break;
      case Categories.Hero:
        {
          _title = "Anh hùng dân tộc";
          final List<Content> loadedContents = [];
          CharacterProvider().Characters.forEach((element) {
            loadedContents
                .add(Content(title: element.name, link: element.link));
          });
          _list_content = loadedContents;
        }
        break;
      case Categories.War:
        {
          _title = "Các trận chiến";
          _list_content = [];
        }
        break;
      case Categories.CountryName:
        {
          _title = "Quốc hiệu";
          _list_content = [];
        }
        break;
      default:
    }
  }
}
