import 'package:hisapp/helpers/db_helper.dart';

class SeedData {
  static Future<void> insertContentCategory() async {
    await DBHelper.insert('content_category', {
      'id': '1',
      'title': 'Thời kỳ lịch sử',
      'number': 1,
      'image_path': 'assets/images/trongdong.png',
    });
    await DBHelper.insert('content_category', {
      'id': '2',
      'title': 'Anh hùng dân tộc',
      'number': 2,
      'image_path': 'assets/images/trongdong_real.jpg',
    });
    await DBHelper.insert('content_category', {
      'id': '3',
      'title': 'Các trận đánh hay',
      'number': 3,
      'image_path': 'assets/images/home_bg.png',
    });
    await DBHelper.insert('content_category', {
      'id': '4',
      'title': 'Quốc hiệu',
      'number': 4,
      'image_path': 'assets/images/vietnam_banner.jpg',
    });
  }

  static Future<void> insertContentTKLS() async {
    await DBHelper.insert('content', {
      'id': '1',
      'title': 'Thời tiền sử',
      'id_category': '1',
      'file_path': 'assets/contents/thoi_ky_lich_su/tien_su.txt',
      'image_path': 'assets/images/thoi_tien_su.jpg',
      'video_path': 'https://www.youtube.com/watch?v=RQS9GOIBOtE',
      'is_done': 0,
      'number': 1,
    });
    await DBHelper.insert('content', {
      'id': '2',
      'title': 'Thời Hồng Bàng',
      'id_category': '1',
      'file_path': 'assets/contents/thoi_ky_lich_su/hong_ban.txt',
      'image_path': 'assets/images/hong_ban.jpg',
      'video_path': 'https://www.youtube.com/watch?v=6cUAw9K3Ymg',
      'is_done': 0,
      'number': 2,
    });
    await DBHelper.insert('content', {
      'id': '3',
      'title': 'Thời Bắc thuộc lần I',
      'id_category': '1',
      'file_path': 'assets/contents/thoi_ky_lich_su/bac_thuoc_lan_1.txt',
      'image_path': 'assets/images/bac_thuoc_lan_1.jpg',
      'video_path': 'https://www.youtube.com/watch?v=skHSViefhjw',
      'is_done': 0,
      'number': 3,
    });
    await DBHelper.insert('content', {
      'id': '4',
      'title': 'Thời kỳ Bắc thuộc lần II',
      'id_category': '1',
      'file_path': 'assets/contents/thoi_ky_lich_su/bac_thuoc_lan_2.txt',
      'image_path': 'assets/images/bac_thuoc_lan_2.png',
      'video_path': 'https://www.youtube.com/watch?v=aDuuPAEE7MM',
      'is_done': 0,
      'number': 4,
    });
    await DBHelper.insert('content', {
      'id': '5',
      'title': 'Thời kỳ độc lập tự chủ',
      'id_category': '1',
      'file_path': 'assets/contents/thoi_ky_lich_su/doc_lap_tu_chu.txt',
      'image_path': 'assets/images/doc_lap_tu_chu.png',
      'video_path': 'https://www.youtube.com/watch?v=BLcc4LTjfVo',
      'is_done': 0,
      'number': 5,
    });
    await DBHelper.insert('content', {
      'id': '6',
      'title': 'Thời kỳ Bắc Thuộc lần IV',
      'id_category': '1',
      'file_path': 'assets/contents/thoi_ky_lich_su/bac_thuoc_lan_4.txt',
      'image_path': 'assets/images/bac_thuoc_lan_4.png',
      'video_path': 'https://www.youtube.com/watch?v=j29UOT2oS2M',
      'is_done': 0,
      'number': 6,
    });
    await DBHelper.insert('content', {
      'id': '7',
      'title': 'Nhà Hậu Lê – Lê sơ',
      'id_category': '1',
      'file_path': 'assets/contents/thoi_ky_lich_su/hau_le_le_so.txt',
      'image_path': 'assets/images/hau_le_le_so.png',
      'video_path': 'https://www.youtube.com/watch?v=i_6IUT1s2ZM',
      'is_done': 0,
      'number': 7,
    });
    await DBHelper.insert('content', {
      'id': '8',
      'title': 'Nhà Hậu Lê – Lê Trung Hưng / Nam – Bắc triều',
      'id_category': '1',
      'file_path':
          'assets/contents/thoi_ky_lich_su/haule_letrunghung_nam_bac_trieu.txt',
      'image_path': 'assets/images/nam_bac_trieu.png',
      'video_path': 'https://www.youtube.com/watch?v=V-1szb5cSsE',
      'is_done': 0,
      'number': 8,
    });
    await DBHelper.insert('content', {
      'id': '9',
      'title': 'Nhà Hậu Lê – Lê Trung Hưng / Đàng ngoài – Đàng trong',
      'id_category': '1',
      'file_path':
          'assets/contents/thoi_ky_lich_su/haule_letrunghung_dangtrong_dangngoai.txt',
      'image_path': 'assets/images/dang_ngoai_trong.png',
      'video_path': 'https://www.youtube.com/watch?v=V1LFhyv_p0w',
      'is_done': 0,
      'number': 9,
    });
    await DBHelper.insert('content', {
      'id': '10',
      'title': 'Nhà Tây Sơn',
      'id_category': '1',
      'file_path': 'assets/contents/thoi_ky_lich_su/tay_son.txt',
      'image_path': 'assets/images/tay_son.png',
      'video_path': 'https://www.youtube.com/watch?v=xWRR43g5VWQ',
      'is_done': 0,
      'number': 10,
    });
    await DBHelper.insert('content', {
      'id': '11',
      'title': 'Nhà Nguyễn – Thời kỳ độc lập tự chủ',
      'id_category': '1',
      'file_path':
          'assets/contents/thoi_ky_lich_su/nguyen_thoi_ki_doc_lap_tu_chu.txt',
      'image_path': 'assets/images/nguyen_doc_lap.png',
      'video_path': 'https://www.youtube.com/watch?v=FnVakQpNHyU',
      'is_done': 0,
      'number': 11,
    });
    await DBHelper.insert('content', {
      'id': '12',
      'title': 'Nhà Nguyễn – Thời kỳ Pháp thuộc',
      'id_category': '1',
      'file_path':
          'assets/contents/thoi_ky_lich_su/nguyen_thoi_ki_phap_thuoc.txt',
      'image_path': 'assets/images/phap_thuoc.png',
      'video_path': 'https://www.youtube.com/watch?v=qoiUdGhAvRM',
      'is_done': 0,
      'number': 12,
    });
    await DBHelper.insert('content', {
      'id': '13',
      'title': 'Thời kỳ đổi mới',
      'id_category': '1',
      'file_path': 'assets/contents/thoi_ky_lich_su/thoi_ky_doi_moi.txt',
      'image_path': 'assets/images/vietnam_nay.png',
      'video_path': 'https://www.youtube.com/watch?v=IJRA-wizk4w',
      'is_done': 0,
      'number': 13,
    });
  }

  static Future<void> insertContentAHDT() async {}

  static Future<void> insertContentTD() async {
    await DBHelper.insert('content', {
      'id': '14',
      'title': 'Trận chiến trên sông Bạch Đằng (938)',
      'id_category': '3',
      'file_path': 'assets/contents/tran_danh/song_bach_dang.txt',
      'image_path': 'assets/images/bach_dang.jpg',
      'video_path': 'https://www.youtube.com/watch?v=SIO3T0Yli3g',
      'is_done': 0,
      'number': 1,
    });
  }

  static Future<void> insertContentQH() async {}

  static Future<void> insertQuestion() async {
    await DBHelper.insert('question', {
      'id': '1',
      'sentence': 'Ngô Quyền lên ngôi vua, đóng đô ở đâu?',
      'id_content': '1',
      'number': 1,
      'answer_index': 0,
    });
    await DBHelper.insert('question', {
      'id': '2',
      'sentence': 'Vì sao Ngô Quyền không duy trì chính quyền của họ Khúc?',
      'id_content': '1',
      'number': 2,
      'answer_index': 1,
    });
    await DBHelper.insert('question', {
      'id': '3',
      'sentence': 'Vì sao Ngô Quyền không duy trì chính quyền của họ Khúc?',
      'id_content': '2',
      'number': 1,
      'answer_index': 1,
    });
  }

  static Future<void> insertAnswer() async {
    await DBHelper.insert('answer', {
      'id': '1',
      'sentence': 'Cổ Loa',
      'id_question': '1',
      'id_content': '1',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '2',
      'sentence': 'Hoa Lư',
      'id_question': '1',
      'id_content': '1',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '3',
      'sentence': 'Bạch Hạc',
      'id_question': '1',
      'id_content': '1',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '4',
      'sentence': 'Phong Châu',
      'id_question': '1',
      'id_content': '1',
      'number': 3,
    });
    await DBHelper.insert('answer', {
      'id': '5',
      'sentence': 'Chính quyền họ Khúc về danh nghĩa vẫn thuộc nhà Đường',
      'id_question': '2',
      'id_content': '1',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '6',
      'sentence':
          'Ngô Quyền muốn phát triển đất nước thành một Quốc gia độc lập, thiết lập một chính quyền hoàn toàn của người Việt',
      'id_question': '2',
      'id_content': '1',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '7',
      'sentence': 'xxx',
      'id_question': '2',
      'id_content': '1',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '8',
      'sentence': 'xxx',
      'id_question': '2',
      'id_content': '1',
      'number': 3,
    });
    await DBHelper.insert('answer', {
      'id': '9',
      'sentence': 'Chính quyền họ Khúc về danh nghĩa vẫn thuộc nhà Đường',
      'id_question': '3',
      'id_content': '2',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '10',
      'sentence':
          'Ngô Quyền muốn phát triển đất nước thành một Quốc gia độc lập, thiết lập một chính quyền hoàn toàn của người Việt',
      'id_question': '3',
      'id_content': '2',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '11',
      'sentence': 'xxx',
      'id_question': '3',
      'id_content': '2',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '12',
      'sentence': 'xxx',
      'id_question': '3',
      'id_content': '2',
      'number': 3,
    });
  }
}
