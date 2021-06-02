class Category {
  final String title;
  final String id;
  final int number;
  final String imagePath;
  final String description;

  Category(
      {this.title, this.id, this.number, this.imagePath, this.description});
}

/* List<Category> categories = categoriesData
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
  }, */
//];
