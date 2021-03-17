import 'package:hisapp/constants.dart';

class Category {
  final String name;
  final Categories id;
  final String image;

  Category(this.name, this.id, this.image);
}

List<Category> categories = categoriesData
    .map((item) => Category(item['name'], item['id'], item['image']))
    .toList();

var categoriesData = [
  {
    "name": "Sự kiện lịch sử",
    'id': Categories.HistoryEvent,
    'image': "assets/images/marketing.png"
  },
  {
    "name": "Anh hùng dân tộc",
    'id': Categories.Hero,
    'image': "assets/images/ux_design.png"
  },
  {
    "name": "Các trận chiến",
    'id': Categories.War,
    'image': "assets/images/ux_design.png"
  },
  {
    "name": "Quốc hiệu",
    'id': Categories.CountryName,
    'image': "assets/images/business.png"
  },
];
