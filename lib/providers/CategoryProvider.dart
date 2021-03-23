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

    await DBHelper.insert('content', {
      'id': '1',
      'title': 'Thời tiền sử',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/tien_su.txt',
      'imagePath': 'assets/images/thoi_tien_su.jpg',
      'isDone': 0,
      'number': 1,
    });
    await DBHelper.insert('content', {
      'id': '2',
      'title': 'Thời Hồng Bàng',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/hong_ban.txt',
      'imagePath': 'assets/images/thoi_hong_ban.jpg',
      'isDone': 0,
      'number': 2,
    });
    await DBHelper.insert('content', {
      'id': '3',
      'title': 'Thời Bắc thuộc lần I',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/bac_thuoc_1.txt',
      'imagePath': 'assets/images/thoi_bac_thuoc_1.jpg',
      'isDone': 0,
      'number': 3,
    });
    await DBHelper.insert('content', {
      'id': '4',
      'title': 'Thời kỳ Bắc thuộc lần II',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/bac_thuoc_2.txt',
      'imagePath': 'assets/images/thoi_bac_thuoc_2.jpg',
      'isDone': 0,
      'number': 4,
    });
    await DBHelper.insert('content', {
      'id': '5',
      'title': 'Thời kỳ độc lập tự chủ',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/tu_chu.txt',
      'imagePath': 'assets/images/thoi_tu_chu.jpg',
      'isDone': 0,
      'number': 5,
    });
    await DBHelper.insert('content', {
      'id': '6',
      'title': 'Thời kỳ Bắc Thuộc lần IV',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/bac_thuoc_4.txt',
      'imagePath': 'assets/images/thoi_bac_thuoc_4.jpg',
      'isDone': 0,
      'number': 6,
    });
    await DBHelper.insert('content', {
      'id': '7',
      'title': 'Nhà Hậu Lê – Lê sơ',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/bac_thuoc_4.txt',
      'imagePath': 'assets/images/thoi_bac_thuoc_4.jpg',
      'isDone': 0,
      'number': 7,
    });
    await DBHelper.insert('content', {
      'id': '8',
      'title': 'Nhà Hậu Lê – Lê Trung Hưng / Nam – Bắc triều',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/bac_thuoc_4.txt',
      'imagePath': 'assets/images/thoi_bac_thuoc_4.jpg',
      'isDone': 0,
      'number': 8,
    });
    await DBHelper.insert('content', {
      'id': '9',
      'title': 'Nhà Hậu Lê – Lê Trung Hưng / Đàng ngoài – Đàng trong',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/bac_thuoc_4.txt',
      'imagePath': 'assets/images/thoi_bac_thuoc_4.jpg',
      'isDone': 0,
      'number': 9,
    });
    await DBHelper.insert('content', {
      'id': '10',
      'title': 'Nhà Tây Sơn',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/bac_thuoc_4.txt',
      'imagePath': 'assets/images/thoi_bac_thuoc_4.jpg',
      'isDone': 0,
      'number': 10,
    });
    await DBHelper.insert('content', {
      'id': '11',
      'title': 'Nhà Nguyễn – Thời kỳ độc lập tự chủ',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/bac_thuoc_4.txt',
      'imagePath': 'assets/images/thoi_bac_thuoc_4.jpg',
      'isDone': 0,
      'number': 11,
    });
    await DBHelper.insert('content', {
      'id': '12',
      'title': 'Nhà Nguyễn – Thời kỳ Pháp thuộc',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/bac_thuoc_4.txt',
      'imagePath': 'assets/images/thoi_bac_thuoc_4.jpg',
      'isDone': 0,
      'number': 12,
    });
    await DBHelper.insert('content', {
      'id': '13',
      'title': 'Thời kỳ đổi mới',
      'id_category': '1',
      'filePath': 'assets/contents/su_kien_lich_su/doi_moi.txt',
      'imagePath': 'assets/images/thoi_doi_moi.jpg',
      'isDone': 0,
      'number': 13,
    });
  }
}
