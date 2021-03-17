import 'package:flutter/material.dart';
import '../models/Character.dart';

class CharacterProvider extends ChangeNotifier {
  List<Character> _list_character = [
    Character(
        name: "Lý Thường Kiệt", image: "assets/images/james.png", link: ""),
    Character(name: "Lê Lợi", image: "assets/images/james.png", link: ""),
    Character(name: "Nguyễn Huệ", image: "assets/images/james.png", link: ""),
  ];

  List<Character> get Characters {
    return [..._list_character];
  }

  void AddCharacter(Character _character) {
    _list_character.add(_character);
    notifyListeners();
  }
}
