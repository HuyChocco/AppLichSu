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
    //Thời tiền sử
    await DBHelper.insert('question', {
      'id': '1',
      'sentence':
          'Nền văn hóa Đông Sơn thuộc thời đại tiền sử Việt Nam giai đoạn nào?',
      'id_content': '1',
      'number': 1,
      'answer_index': 3,
    });
    //Thời Hồng Bàn
    await DBHelper.insert('question', {
      'id': '2',
      'sentence': 'Nhà nước nào sau đây không thục thời Hồng Bàn?',
      'id_content': '2',
      'number': 2,
      'answer_index': 1,
    });
    //Bắc thuộc lần 1
    await DBHelper.insert('question', {
      'id': '3',
      'sentence':
          'Nhà Hán đã chia nước Nam Việt thành mấy quận sau khi nước Nam Việt bị sáp nhập vào lãnh thổ nhà Hán?',
      'id_content': '3',
      'number': 3,
      'answer_index': 2,
    });
    //Bắc thuộc lần 2
    await DBHelper.insert('question', {
      'id': '4',
      'sentence':
          'Cuộc khởi nghĩa của bà Triệu chống lại nhà nước Đông Ngô diễn ra nào năm bao nhiêu?',
      'id_content': '4',
      'number': 4,
      'answer_index': 1,
    });
    //Độc lập tự chủ
    await DBHelper.insert('question', {
      'id': '5',
      'sentence': 'Cuộc chiến chống quân Mông Nguyên diễn ra vào nhà nào?',
      'id_content': '5',
      'number': 5,
      'answer_index': 3,
    });
    //Bắc thuộc lần 4
    await DBHelper.insert('question', {
      'id': '6',
      'sentence': 'Nhà Trần thất bại dưới tay quân nhà Minh vào năm bao nhiêu?',
      'id_content': '6',
      'number': 6,
      'answer_index': 0,
    });
    //Nhà hậu lê-lê sơ
    await DBHelper.insert('question', {
      'id': '7',
      'sentence':
          'Năm 1427, Lê lợi đã lãnh đạo quân đội đánh tan 15 vạn quân Minh và chém chết Liễu Thăng. Năm 1428 ông lên ngôi hoàng đế, lấy hiệu gì?',
      'id_content': '7',
      'number': 7,
      'answer_index': 0,
    });
    //lê trung hưng/nam-bắc triều
    await DBHelper.insert('question', {
      'id': '8',
      'sentence':
          'Năm 1527 Mạc Đăng Dung cướp ngôi nhà Lê, thành lập nhà Mạc (Bắc triều). Sau sự kiện đó, ai là người không phục nhà Mạc nên đã bỏ vào Thanh Hoá, đón Lê Duy Ninh về lập làm hoàng đế, tức Lê Trang Tông (Nam Triều)?',
      'id_content': '8',
      'number': 8,
      'answer_index': 1,
    });
    //Đàng ngoài-Đàng trong
    await DBHelper.insert('question', {
      'id': '9',
      'sentence':
          'Ai là người 2 lần đánh bại cuộc tiến công của chúa Trịnh ở Đàng Ngoài. Ông cũng được dân gian gọi là chúa Sãi (Sãi vương), hay chúa Bụt (Phật vương)?',
      'id_content': '9',
      'number': 9,
      'answer_index': 3,
    });
    //Tây Sơn
    await DBHelper.insert('question', {
      'id': '10',
      'sentence': 'Triều đại Tây Sơn kết thúc vào năm bao nhiêu?',
      'id_content': '10',
      'number': 10,
      'answer_index': 1,
    });
    //Nhà Nguyễn
    await DBHelper.insert('question', {
      'id': '11',
      'sentence': 'Năm bao nhiêu Pháp đem quân đánh Đà Nẵng?',
      'id_content': '11',
      'number': 11,
      'answer_index': 1,
    });
    //Pháp thuộc
    await DBHelper.insert('question', {
      'id': '12',
      'sentence':
          'Ai là vị hoàng đế cuối cùng của triều đại phong kiến trong lịch sử Việt Nam?',
      'id_content': '12',
      'number': 12,
      'answer_index': 2,
    });
    //Đổi mới
    await DBHelper.insert('question', {
      'id': '13',
      'sentence':
          'Chủ tịch Hồ Chí Minh đã đọc bản tuyên ngôn độc lập tại quãng trường Ba Đình, khai sinh ra nước Việt Nam Dân Chủ Cộng Hòa với thủ đô là Hà Nội vào thời gian nào?',
      'id_content': '13',
      'number': 13,
      'answer_index': 1,
    });
  }

  static Future<void> insertAnswer() async {
    //Câu hỏi 1 - Thời tiền sử
    await DBHelper.insert('answer', {
      'id': '1',
      'sentence': 'Đồ đá cũ',
      'id_question': '1',
      'id_content': '1',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '2',
      'sentence': 'Đồ đá mới',
      'id_question': '1',
      'id_content': '1',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '3',
      'sentence': 'Đồ đồng',
      'id_question': '1',
      'id_content': '1',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '4',
      'sentence': 'Đồ sắt',
      'id_question': '1',
      'id_content': '1',
      'number': 3,
    });
    // Câu hỏi 2
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
    //Câu hỏi 3
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
    //Câu hỏi 4
    //Câu hỏi 5
    //Câu hỏi 6
    //Câu hỏi 7
    //Câu hỏi 8
    //Câu hỏi 9
    //Câu hỏi 10
    //Câu hỏi 11
    //Câu hỏi 12
    //Câu hỏi 13
  }
}
