import 'package:hisapp/helpers/db_helper.dart';

class SeedData {
  static Future<void> insertAnniversary() async {
    await DBHelper.insert('anniversary', {
      'id': '1',
      'day': 3,
      'month': 2,
      'year': 1930,
      'content':
          'Kỷ niệm 91 năm Ngày thành lập Đảng Cộng sản Việt Nam (3/2/1930)',
    });
    await DBHelper.insert('anniversary', {
      'id': '2',
      'day': 30,
      'month': 4,
      'year': 1975,
      'content':
          'Kỷ niệm Ngày giải phóng miền Nam, thống nhất đất nước (30/4/1975)',
    });
    await DBHelper.insert('anniversary', {
      'id': '3',
      'day': 7,
      'month': 5,
      'year': 1954,
      'content': 'Kỷ niệm Ngày Chiến thắng Điện Biên Phủ (7/5/1954)',
    });
    await DBHelper.insert('anniversary', {
      'id': '4',
      'day': 19,
      'month': 8,
      'year': 1945,
      'content': 'Kỷ niệm Ngày Cách mạng tháng Tám thành công (19/8/1945)',
    });
    await DBHelper.insert('anniversary', {
      'id': '5',
      'day': 2,
      'month': 9,
      'year': 1945,
      'content':
          'Ngày Quốc khánh nước Cộng hoà xã hội chủ nghĩa Việt Nam (2/9/1945)',
    });

    await DBHelper.insert('anniversary', {
      'id': '6',
      'day': 25,
      'month': 8,
      'year': 1911,
      'content': 'Kỷ niệm Ngày sinh Đại tướng Võ Nguyên Giáp (25/8/1911)',
    });
    await DBHelper.insert('anniversary', {
      'id': '7',
      'day': 10,
      'month': 10,
      'year': 1911,
      'content': 'Kỷ niệm Ngày sinh đồng chí Lê Đức Thọ (10/10/1911)',
    });
    await DBHelper.insert('anniversary', {
      'id': '8',
      'day': 28,
      'month': 1,
      'year': 1941,
      'content':
          'Kỷ niệm Ngày Bác Hồ về nước trực tiếp lãnh đạo cách mạng Việt Nam (28/01/1941)',
    });
    await DBHelper.insert('anniversary', {
      'id': '9',
      'day': 5,
      'month': 6,
      'year': 1911,
      'content': 'Kỷ niệm Ngày Bác Hồ ra đi tìm đường cứu nước (05/6/1911)',
    });
    await DBHelper.insert('anniversary', {
      'id': '10',
      'day': 23,
      'month': 10,
      'year': 1961,
      'content': 'Kỷ niệm Ngày mở đường Hồ Chí Minh trên biển (23/10/1961)',
    });
  }

  static Future<void> insertContentCategory() async {
    await DBHelper.insert('content_category', {
      'id': '1',
      'title': 'Thời kỳ lịch sử',
      'number': 1,
      'image_path': 'assets/images/trongdong.png',
      'description':
          'Tóm tắt các sự kiện chính qua các thời kỳ lịch sử nước ta',
    });
    await DBHelper.insert('content_category', {
      'id': '2',
      'title': 'Anh hùng dân tộc',
      'number': 2,
      'image_path': 'assets/images/trongdong_real.jpg',
      'description':
          'Những nhân vật có ảnh hưởng lớn đến sự hình thành và phát triển của Việt Nam',
    });
    await DBHelper.insert('content_category', {
      'id': '3',
      'title': 'Các trận đánh hay',
      'number': 3,
      'image_path': 'assets/images/home_bg.png',
      'description': 'Tóm tắt các trận đánh hay trong lịch sử Việt Nam',
    });
    await DBHelper.insert('content_category', {
      'id': '4',
      'title': 'Quốc hiệu, Triều đại',
      'number': 4,
      'image_path': 'assets/images/vietnam_banner.jpg',
      'description': 'Tên nước ta qua các thời kỳ',
    });
  }

  static Future<void> insertContentTKLS() async {
    await DBHelper.insert('content', {
      'id': '1',
      'title': 'Thời tiền sử',
      'id_category': '1',
      'time': 'Hàng trăm ngàn năm trước',
      'file_path': 'assets/contents/thoi_ky_lich_su/tien_su.txt',
      'image_path': 'assets/images/thoi_tien_su.jpg',
      'video_path': 'https://www.youtube.com/watch?v=RQS9GOIBOtE',
      'is_done': 0,
      'number': 1,
      'key_word': 'Tiền sử',
    });
    await DBHelper.insert('content', {
      'id': '2',
      'title': 'Thời Hồng Bàng',
      'time': '2879 TCN – 208 TCN',
      'id_category': '1',
      'file_path': 'assets/contents/thoi_ky_lich_su/hong_ban.txt',
      'image_path': 'assets/images/hong_ban.jpg',
      'video_path': 'https://www.youtube.com/watch?v=6cUAw9K3Ymg',
      'is_done': 0,
      'number': 2,
      'key_word': 'Hồng Bàn',
    });
    await DBHelper.insert('content', {
      'id': '3',
      'title': 'Thời Bắc thuộc lần I',
      'id_category': '1',
      'time': '208 TCN – 39',
      'file_path': 'assets/contents/thoi_ky_lich_su/bac_thuoc_lan_1.txt',
      'image_path': 'assets/images/bac_thuoc_lan_1.jpg',
      'video_path': 'https://www.youtube.com/watch?v=skHSViefhjw',
      'is_done': 0,
      'number': 3,
      'key_word': 'Bắc thuộc lần I',
    });
    await DBHelper.insert('content', {
      'id': '4',
      'title': 'Thời kỳ Bắc thuộc lần II',
      'id_category': '1',
      'time': '43 – 543',
      'file_path': 'assets/contents/thoi_ky_lich_su/bac_thuoc_lan_2.txt',
      'image_path': 'assets/images/bac_thuoc_lan_2.png',
      'video_path': 'https://www.youtube.com/watch?v=aDuuPAEE7MM',
      'is_done': 0,
      'number': 4,
      'key_word': 'Bắc thuộc lần II',
    });
    await DBHelper.insert('content', {
      'id': '5',
      'title': 'Thời kỳ độc lập tự chủ',
      'id_category': '1',
      'time': '905 – 938',
      'file_path': 'assets/contents/thoi_ky_lich_su/doc_lap_tu_chu.txt',
      'image_path': 'assets/images/doc_lap_tu_chu.png',
      'video_path': 'https://www.youtube.com/watch?v=BLcc4LTjfVo',
      'is_done': 0,
      'number': 5,
      'key_word': 'Thời kỳ độc lập tự chủ',
    });
    await DBHelper.insert('content', {
      'id': '6',
      'title': 'Thời kỳ Bắc Thuộc lần IV',
      'id_category': '1',
      'time': '1407 – 1427',
      'file_path': 'assets/contents/thoi_ky_lich_su/bac_thuoc_lan_4.txt',
      'image_path': 'assets/images/bac_thuoc_lan_4.png',
      'video_path': 'https://www.youtube.com/watch?v=j29UOT2oS2M',
      'is_done': 0,
      'number': 6,
      'key_word': 'Bắc Thuộc lần IV',
    });
    await DBHelper.insert('content', {
      'id': '7',
      'title': 'Nhà Hậu Lê – Lê sơ',
      'id_category': '1',
      'time': '1428 – 1527',
      'file_path': 'assets/contents/thoi_ky_lich_su/hau_le_le_so.txt',
      'image_path': 'assets/images/hau_le_le_so.png',
      'video_path': 'https://www.youtube.com/watch?v=i_6IUT1s2ZM',
      'is_done': 0,
      'number': 7,
      'key_word': 'Hậu Lê, Lê sơ',
    });
    await DBHelper.insert('content', {
      'id': '8',
      'title': 'Nhà Hậu Lê – Lê Trung Hưng / Nam – Bắc triều',
      'id_category': '1',
      'time': '1527 – 1592',
      'file_path':
          'assets/contents/thoi_ky_lich_su/haule_letrunghung_nam_bac_trieu.txt',
      'image_path': 'assets/images/nam_bac_trieu.png',
      'video_path': 'https://www.youtube.com/watch?v=V-1szb5cSsE',
      'is_done': 0,
      'number': 8,
      'key_word': 'Nam triều, Bắc triều, Hậu Lê, Trung Hưng',
    });
    await DBHelper.insert('content', {
      'id': '9',
      'title': 'Nhà Hậu Lê – Lê Trung Hưng / Đàng ngoài – Đàng trong',
      'id_category': '1',
      'time': '1593 – 1778',
      'file_path':
          'assets/contents/thoi_ky_lich_su/haule_letrunghung_dangtrong_dangngoai.txt',
      'image_path': 'assets/images/dang_ngoai_trong.png',
      'video_path': 'https://www.youtube.com/watch?v=V1LFhyv_p0w',
      'is_done': 0,
      'number': 9,
      'key_word': 'Đàng ngoài, Đàng trong',
    });
    await DBHelper.insert('content', {
      'id': '10',
      'title': 'Nhà Tây Sơn',
      'id_category': '1',
      'time': '1778-1802',
      'file_path': 'assets/contents/thoi_ky_lich_su/tay_son.txt',
      'image_path': 'assets/images/tay_son.png',
      'video_path': 'https://www.youtube.com/watch?v=xWRR43g5VWQ',
      'is_done': 0,
      'number': 10,
      'key_word': 'Tây Sơn',
    });
    await DBHelper.insert('content', {
      'id': '11',
      'title': 'Nhà Nguyễn – Thời kỳ độc lập tự chủ',
      'id_category': '1',
      'time': '1802 – 1883',
      'file_path':
          'assets/contents/thoi_ky_lich_su/nguyen_thoi_ki_doc_lap_tu_chu.txt',
      'image_path': 'assets/images/nguyen_doc_lap.png',
      'video_path': 'https://www.youtube.com/watch?v=FnVakQpNHyU',
      'is_done': 0,
      'number': 11,
      'key_word': 'Nhà Nguyễn, độc lập tự chủ',
    });
    await DBHelper.insert('content', {
      'id': '12',
      'title': 'Nhà Nguyễn – Thời kỳ Pháp thuộc',
      'id_category': '1',
      'time': '1883 – 1945',
      'file_path':
          'assets/contents/thoi_ky_lich_su/nguyen_thoi_ki_phap_thuoc.txt',
      'image_path': 'assets/images/phap_thuoc.png',
      'video_path': 'https://www.youtube.com/watch?v=qoiUdGhAvRM',
      'is_done': 0,
      'number': 12,
      'key_word': 'Nhà Nguyễn, Pháp thuộc',
    });
    await DBHelper.insert('content', {
      'id': '13',
      'title': 'Thời kỳ đổi mới',
      'id_category': '1',
      'time': '1945 – nay',
      'file_path': 'assets/contents/thoi_ky_lich_su/thoi_ky_doi_moi.txt',
      'image_path': 'assets/images/vietnam_nay.png',
      'video_path': 'https://www.youtube.com/watch?v=IJRA-wizk4w',
      'is_done': 0,
      'number': 13,
      'key_word': 'Đổi mới',
    });
  }

  static Future<void> insertContentAHDT() async {
    await DBHelper.insert('content', {
      'id': '100',
      'title': 'Kinh Dương Vương',
      'id_category': '2',
      'time': '2919TCN - 2792TCN',
      'file_path': 'assets/contents/anh_hung/kinh_duong_vuong.txt',
      'image_path': 'assets/images/kinh_duong_vuong.PNG',
      'video_path': 'https://www.youtube.com/watch?v=ERydxDnGmB8&t=92s',
      'is_done': 0,
      'number': 1,
      'key_word': 'Kinh Dương Vương, Lộc Tục',
    });

    await DBHelper.insert('content', {
      'id': '101',
      'title': 'Lạc Long Quân',
      'id_category': '2',
      'time': 'Khoảng thế kỷ 8-7TCN',
      'file_path': 'assets/contents/anh_hung/lac_long_quan.txt',
      'image_path': 'assets/images/lac_long_quan.PNG',
      'video_path': 'https://www.youtube.com/watch?v=9ESDvo_cgQI&t=17s',
      'is_done': 0,
      'number': 2,
      'key_word': 'Lạc Long Quân, Âu Cơ',
    });

    await DBHelper.insert('content', {
      'id': '102',
      'title': 'Triệu Đà',
      'id_category': '2',
      'time': '257TCN - 137TCN',
      'file_path': 'assets/contents/anh_hung/trieu_da.txt',
      'image_path': 'assets/images/trieu_da.PNG',
      'video_path': 'https://www.youtube.com/watch?v=Ww11vTVYywc&t=59s',
      'is_done': 0,
      'number': 3,
      'key_word': 'Triệu Đà',
    });

    await DBHelper.insert('content', {
      'id': '103',
      'title': 'Trưng Trắc, Trưng Nhị (Hai Bà Trưng)',
      'id_category': '2',
      'time': '14 - 43',
      'file_path': 'assets/contents/anh_hung/trung_trac_trung_nhi.txt',
      'image_path': 'assets/images/hai_ba_trung.PNG',
      'video_path': 'https://www.youtube.com/watch?v=vqvXYvF4Yes',
      'is_done': 0,
      'number': 4,
      'key_word': 'Trưng Trắc, Trưng Nhị, Hai Bà Trưng',
    });

    await DBHelper.insert('content', {
      'id': '104',
      'title': 'Ngô Quyền',
      'id_category': '2',
      'time': '897 - 944',
      'file_path': 'assets/contents/anh_hung/ngo_quyen.txt',
      'image_path': 'assets/images/ngo_quyen.PNG',
      'video_path': 'https://www.youtube.com/watch?v=XBW6-EYoGn0',
      'is_done': 0,
      'number': 5,
      'key_word': 'Ngô Quyền',
    });

    await DBHelper.insert('content', {
      'id': '105',
      'title': 'Đinh Bộ Lĩnh',
      'id_category': '2',
      'time': '22/3/924 - tháng 10/979',
      'file_path': 'assets/contents/anh_hung/dinh_bo_linh.txt',
      'image_path': 'assets/images/dinh_bo_linh.PNG',
      'video_path': 'https://www.youtube.com/watch?v=5LsjpuLgWFM',
      'is_done': 0,
      'number': 6,
      'key_word': 'Đinh Bộ Lĩnh',
    });

    await DBHelper.insert('content', {
      'id': '106',
      'title': 'Lý Thái Tổ',
      'id_category': '2',
      'time': '8/3/974 – 31/3/1028',
      'file_path': 'assets/contents/anh_hung/ly_thai_to.txt',
      'image_path': 'assets/images/ly_thai_to.PNG',
      'video_path': 'https://www.youtube.com/watch?v=TEYubPciKI0',
      'is_done': 0,
      'number': 7,
      'key_word': 'Lý Thái Tổ, Lý Công Uẩn',
    });

    await DBHelper.insert('content', {
      'id': '107',
      'title': 'Lý Thường Kiệt',
      'id_category': '2',
      'time': '1019 – 1105',
      'file_path': 'assets/contents/anh_hung/ly_thuong_kiet.txt',
      'image_path': 'assets/images/ly_thuong_kiet.PNG',
      'video_path': 'https://www.youtube.com/watch?v=wkk3Y7kKAMY',
      'is_done': 0,
      'number': 8,
      'key_word': 'Lý Thường Kiệt',
    });

    await DBHelper.insert('content', {
      'id': '108',
      'title': 'Trần Quốc Tuấn',
      'id_category': '2',
      'time': '? - 20/8/1300',
      'file_path': 'assets/contents/anh_hung/tran_quoc_tuan.txt',
      'image_path': 'assets/images/tran_quoc_tuan.PNG',
      'video_path': 'https://www.youtube.com/watch?v=6c294upVgNs',
      'is_done': 0,
      'number': 9,
      'key_word': 'Trần Quốc Tuấn, Trần Hưng Đạo',
    });

    await DBHelper.insert('content', {
      'id': '109',
      'title': 'Lê Lợi',
      'id_category': '2',
      'time': '10/9/13852 – 5/10/1433',
      'file_path': 'assets/contents/anh_hung/le_loi.txt',
      'image_path': 'assets/images/le_loi.PNG',
      'video_path': 'https://www.youtube.com/watch?v=kUqgQi51-h4',
      'is_done': 0,
      'number': 10,
      'key_word': 'Lê Lợi',
    });

    await DBHelper.insert('content', {
      'id': '110',
      'title': 'Nguyễn Huệ',
      'id_category': '2',
      'time': '1753 – 1792',
      'file_path': 'assets/contents/anh_hung/nguyen_hue.txt',
      'image_path': 'assets/images/nguyen_hue.PNG',
      'video_path': 'https://www.youtube.com/watch?v=j9g3N9li0O8',
      'is_done': 0,
      'number': 11,
      'key_word': 'Nguyễn Huệ, Quang Trung',
    });

    await DBHelper.insert('content', {
      'id': '111',
      'title': 'Võ Nguyên Giáp',
      'id_category': '2',
      'time': '25/8/1911 – 4/10/2013',
      'file_path': 'assets/contents/anh_hung/vo_nguyen_giap.txt',
      'image_path': 'assets/images/vo_nguyen_giap.PNG',
      'video_path': 'https://www.youtube.com/watch?v=8cC-7cuTfks',
      'is_done': 0,
      'number': 12,
      'key_word': 'Võ Nguyên Giáp, Điện Biên Phủ',
    });

    await DBHelper.insert('content', {
      'id': '112',
      'title': 'Bảo Đại',
      'id_category': '2',
      'time': '22/10/1913 – 31/7/1997',
      'file_path': 'assets/contents/anh_hung/bao_dai.txt',
      'image_path': 'assets/images/bao_dai.PNG',
      'video_path': 'https://www.youtube.com/watch?v=T37oYKHjLnQ',
      'is_done': 0,
      'number': 13,
      'key_word': 'Bảo Đại',
    });

    await DBHelper.insert('content', {
      'id': '115',
      'title': 'Hồ Chí Minh',
      'id_category': '2',
      'time': '19/05/1890 - 02/09/1969',
      'file_path': 'assets/contents/anh_hung/ho_chi_minh.txt',
      'image_path': 'assets/images/ho_chi_minh.PNG',
      'video_path': 'https://www.youtube.com/watch?v=WncgG_ZQOyE',
      'is_done': 0,
      'number': 16,
      'key_word':
          'Hồ Chí Minh, Nguyễn Sinh Cung, Nguyễn Tất Thành, 19/5/1890, 2/9/1969, 5/6/1911',
    });
  }

  static Future<void> insertContentTD() async {
    await DBHelper.insert('content', {
      'id': '200',
      'title': 'Trận chiến trên sông Bạch Đằng',
      'id_category': '3',
      'time': '938',
      'file_path': 'assets/contents/tran_danh/song_bach_dang.txt',
      'image_path': 'assets/images/bach_dang.jpg',
      'video_path': 'https://www.youtube.com/watch?v=SIO3T0Yli3g',
      'is_done': 0,
      'number': 1,
      'key_word': 'Trận chiến trên sông Bạch Đằng, 938',
    });

    await DBHelper.insert('content', {
      'id': '201',
      'title': 'Trận Như Nguyệt',
      'id_category': '3',
      'time': '1077',
      'file_path': 'assets/contents/tran_danh/tran_nhu_nguyet.txt',
      'image_path': 'assets/images/tran_nhu_nguyet.PNG',
      'video_path': 'https://www.youtube.com/watch?v=c1aKcDx2FI4',
      'is_done': 0,
      'number': 2,
      'key_word': 'Trận Như Nguyệt, 1077',
    });

    await DBHelper.insert('content', {
      'id': '202',
      'title': 'Trận Đông Bộ Đầu',
      'id_category': '3',
      'time': '1258',
      'file_path': 'assets/contents/tran_danh/tran_dong_bo_dau.txt',
      'image_path': 'assets/images/tran_dong_bo_dau.PNG',
      'video_path': 'https://www.youtube.com/watch?v=lWOIICoV2tE',
      'is_done': 0,
      'number': 3,
      'key_word': 'Trận Đông Bộ Đầu, 1258',
    });

    await DBHelper.insert('content', {
      'id': '203',
      'title': 'Trận Bạch Đằng',
      'id_category': '3',
      'time': '1288',
      'file_path': 'assets/contents/tran_danh/tran_bach_dang.txt',
      'image_path': 'assets/images/tran_bach_dang.PNG',
      'video_path': 'https://www.youtube.com/watch?v=8l-f-a2dQNY',
      'is_done': 0,
      'number': 4,
      'key_word': 'Trận Bạch Đằng, 1288',
    });

    await DBHelper.insert('content', {
      'id': '204',
      'title': 'Trận Chi Lăng – Xương Giang',
      'id_category': '3',
      'time': '1427',
      'file_path': 'assets/contents/tran_danh/tran_chi_lang_xuong_giang.txt',
      'image_path': 'assets/images/tran_chi_lang_xuong_giang.PNG',
      'video_path': 'https://www.youtube.com/watch?v=U1vduFi0Z1I',
      'is_done': 0,
      'number': 5,
      'key_word': 'Trận Chi Lăng – Xương Giang, 1427',
    });

    await DBHelper.insert('content', {
      'id': '205',
      'title': 'Trận Rạch Gầm – Xoài Mút',
      'id_category': '3',
      'time': '1785',
      'file_path': 'assets/contents/tran_danh/tran_rach_gam_xoai_mut.txt',
      'image_path': 'assets/images/tran_rach_gam_xoai_mut.PNG',
      'video_path': 'https://www.youtube.com/watch?v=8YNRXlxH_HI',
      'is_done': 0,
      'number': 6,
      'key_word': 'Trận Rạch Gầm – Xoài Mút, 1785',
    });

    await DBHelper.insert('content', {
      'id': '206',
      'title': 'Trận Ngọc Hồi – Đống Đa',
      'id_category': '3',
      'time': '1789',
      'file_path': 'assets/contents/tran_danh/tran_ngoc_hoi_dong_da.txt',
      'image_path': 'assets/images/tran_ngoc_hoi_dong_da.PNG',
      'video_path': 'https://www.youtube.com/watch?v=qFv6NKIjQj0',
      'is_done': 0,
      'number': 7,
      'key_word': 'Trận Ngọc Hồi – Đống Đa, 1789',
    });

    await DBHelper.insert('content', {
      'id': '207',
      'title': 'Chiến dịch Điện Biên Phủ',
      'id_category': '3',
      'time': '1954',
      'file_path': 'assets/contents/tran_danh/chien_dich_dien_bien_phu.txt',
      'image_path': 'assets/images/chien_dich_dien_bien_phu.PNG',
      'video_path': 'https://www.youtube.com/watch?v=P83Ik_E9Z78',
      'is_done': 0,
      'number': 8,
      'key_word': 'Chiến dịch Điện Biên Phủ, 1954',
    });

    await DBHelper.insert('content', {
      'id': '208',
      'title': 'Trận Điện Biên Phủ trên không',
      'id_category': '3',
      'time': '1972',
      'file_path':
          'assets/contents/tran_danh/tran_dien_bien_phu_tren_khong.txt',
      'image_path': 'assets/images/tran_dien_bien_phu_tren_khong.PNG',
      'video_path': 'https://www.youtube.com/watch?v=5581I3GotxA',
      'is_done': 0,
      'number': 9,
      'key_word': 'Trận Điện Biên Phủ trên không, 1972',
    });

    await DBHelper.insert('content', {
      'id': '209',
      'title': 'Chiến dịch Hồ Chí Minh',
      'id_category': '3',
      'time': '1975',
      'file_path': 'assets/contents/tran_danh/chien_dich_ho_chi_minh.txt',
      'image_path': 'assets/images/chien_dich_ho_chi_minh.PNG',
      'video_path': 'https://www.youtube.com/watch?v=y9DTvCUL1Yg',
      'is_done': 0,
      'number': 10,
      'key_word': 'Chiến dịch Hồ Chí Minh, 1975, 30 tháng 4',
    });
  }

  static Future<void> insertContentQH() async {
    await DBHelper.insert('content', {
      'id': '300',
      'title': 'Họ Hồng Bàng',
      'id_category': '4',
      'time': 'Năm 2879TCN',
      'file_path': 'assets/contents/quoc_hieu/ho_hong_bang.txt',
      'image_path': 'assets/images/ho_hong_bang.PNG',
      'video_path': 'https://www.youtube.com/watch?v=6cUAw9K3Ymg',
      'is_done': 0,
      'number': 1,
      'key_word': 'Họ Hồng Bàng, 2879TCN',
    });
    await DBHelper.insert('content', {
      'id': '301',
      'title': 'Nhà Thục',
      'id_category': '4',
      'time': 'Năm 257TCN',
      'file_path': 'assets/contents/quoc_hieu/nha_thuc.txt',
      'image_path': 'assets/images/nha_thuc.PNG',
      'video_path': 'https://www.youtube.com/watch?v=T4T3ZWUMZNc',
      'is_done': 0,
      'number': 2,
      'key_word': 'Nhà Thục, 257TCN',
    });
    await DBHelper.insert('content', {
      'id': '302',
      'title': 'Nhà Triệu',
      'id_category': '4',
      'time': 'Năm 207TCN',
      'file_path': 'assets/contents/quoc_hieu/nha_trieu.txt',
      'image_path': 'assets/images/nha_trieu.PNG',
      'video_path': 'https://www.youtube.com/watch?v=Wa7WjSjiR_k',
      'is_done': 0,
      'number': 3,
      'key_word': 'Nhà Triệu, 207TCN',
    });
    await DBHelper.insert('content', {
      'id': '303',
      'title': 'Trưng Nữ Vương',
      'id_category': '4',
      'time': 'Năm 40',
      'file_path': 'assets/contents/quoc_hieu/truong_nu_vuong.txt',
      'image_path': 'assets/images/truong_nu_vuong.PNG',
      'video_path': 'https://www.youtube.com/watch?v=wnv6D_TSoKY',
      'is_done': 0,
      'number': 4,
      'key_word': 'Trưng Nữ Vương, 40',
    });
    await DBHelper.insert('content', {
      'id': '304',
      'title': 'Nhà Tiền Lý và Nhà Triệu',
      'id_category': '4',
      'time': 'Năm 544',
      'file_path': 'assets/contents/quoc_hieu/nha_tien_ly_va_nha_trieu.txt',
      'image_path': 'assets/images/nha_tien_ly_va_nha_trieu.PNG',
      'video_path': 'https://www.youtube.com/watch?v=uTQnYPj0OO4',
      'is_done': 0,
      'number': 5,
      'key_word': 'Nhà Tiền Lý và Nhà Triệu, 544',
    });
    await DBHelper.insert('content', {
      'id': '305',
      'title': 'Triều Ngô',
      'id_category': '4',
      'time': 'Năm 939',
      'file_path': 'assets/contents/quoc_hieu/trieu_ngo.txt',
      'image_path': 'assets/images/nha_ngo.PNG',
      'video_path': 'https://www.youtube.com/watch?v=ZUK28Ps-jFo',
      'is_done': 0,
      'number': 6,
      'key_word': 'Triều Ngô, 939',
    });
    await DBHelper.insert('content', {
      'id': '306',
      'title': 'Nhà Đinh',
      'id_category': '4',
      'time': 'Năm 968',
      'file_path': 'assets/contents/quoc_hieu/nha_dinh.txt',
      'image_path': 'assets/images/nha_dinh.PNG',
      'video_path': 'https://www.youtube.com/watch?v=cA1rus2u1fQ',
      'is_done': 0,
      'number': 7,
      'key_word': 'Nhà Đinh, 968',
    });
    await DBHelper.insert('content', {
      'id': '307',
      'title': 'Nhà Tiền Lê',
      'id_category': '4',
      'time': 'Năm 980',
      'file_path': 'assets/contents/quoc_hieu/nha_tien_le.txt',
      'image_path': 'assets/images/nha_tien_le.PNG',
      'video_path': 'https://www.youtube.com/watch?v=7XSTBIGywz0',
      'is_done': 0,
      'number': 8,
      'key_word': 'Nhà Tiền Lê, 980',
    });
    await DBHelper.insert('content', {
      'id': '308',
      'title': 'Nhà Lý',
      'id_category': '4',
      'time': 'Năm 1009',
      'file_path': 'assets/contents/quoc_hieu/nha_ly.txt',
      'image_path': 'assets/images/nha_ly.PNG',
      'video_path': 'https://www.youtube.com/watch?v=rop6suLHfjc',
      'is_done': 0,
      'number': 9,
      'key_word': 'Nhà Lý, 1009',
    });
    await DBHelper.insert('content', {
      'id': '309',
      'title': 'Nhà Trần',
      'id_category': '4',
      'time': 'Năm 1225',
      'file_path': 'assets/contents/quoc_hieu/nha_tran.txt',
      'image_path': 'assets/images/nha_tran.PNG',
      'video_path': 'https://www.youtube.com/watch?v=jxJQqPkIe-4',
      'is_done': 0,
      'number': 10,
      'key_word': 'Nhà Trần, 1225',
    });
    await DBHelper.insert('content', {
      'id': '310',
      'title': 'Nhà Hồ',
      'id_category': '4',
      'time': 'Năm 1400',
      'file_path': 'assets/contents/quoc_hieu/nha_ho.txt',
      'image_path': 'assets/images/nha_ho.PNG',
      'video_path': 'https://www.youtube.com/watch?v=fG-mrz_O980',
      'is_done': 0,
      'number': 11,
      'key_word': 'Nhà Hồ, 1400',
    });
    await DBHelper.insert('content', {
      'id': '311',
      'title': 'Triều Lê Sơ',
      'id_category': '4',
      'time': 'Năm 1428',
      'file_path': 'assets/contents/quoc_hieu/trieu_le_so.txt',
      'image_path': 'assets/images/trieu_le_so.PNG',
      'video_path': 'https://www.youtube.com/watch?v=ysjemSMyeFU',
      'is_done': 0,
      'number': 12,
      'key_word': 'Triều Lê Sơ, 1428',
    });
    await DBHelper.insert('content', {
      'id': '312',
      'title': 'Nhà Mạc',
      'id_category': '4',
      'time': 'Năm 1527',
      'file_path': 'assets/contents/quoc_hieu/nha_mac.txt',
      'image_path': 'assets/images/nha_mac.PNG',
      'video_path': 'https://www.youtube.com/watch?v=TPmqZYMOeHs',
      'is_done': 0,
      'number': 13,
      'key_word': 'Nhà Mạc, 1527',
    });
    await DBHelper.insert('content', {
      'id': '313',
      'title': 'Triều Hậu Lê',
      'id_category': '4',
      'time': 'Năm 1533',
      'file_path': 'assets/contents/quoc_hieu/trieu_hau_le.txt',
      'image_path': 'assets/images/trieu_hau_le.PNG',
      'video_path': 'https://www.youtube.com/watch?v=o-6p2T3UFdk',
      'is_done': 0,
      'number': 14,
      'key_word': 'Triều Hậu Lê, 1533',
    });
    await DBHelper.insert('content', {
      'id': '314',
      'title': 'Nhà Tây Sơn',
      'id_category': '4',
      'time': 'Năm 1788',
      'file_path': 'assets/contents/quoc_hieu/nha_tay_son.txt',
      'image_path': 'assets/images/nha_tay_son.PNG',
      'video_path': 'https://www.youtube.com/watch?v=VYdU_F6N-jU',
      'is_done': 0,
      'number': 15,
      'key_word': 'Nhà Tây Sơn, 1788',
    });
    await DBHelper.insert('content', {
      'id': '315',
      'title': 'Nhà Nguyễn',
      'id_category': '4',
      'time': 'Năm 1802',
      'file_path': 'assets/contents/quoc_hieu/nha_nguyen.txt',
      'image_path': 'assets/images/nha_nguyen.PNG',
      'video_path': 'https://www.youtube.com/watch?v=qoiUdGhAvRM&t=36s',
      'is_done': 0,
      'number': 16,
      'key_word': 'Nhà Nguyễn, 1802',
    });
    await DBHelper.insert('content', {
      'id': '316',
      'title': 'Nước Việt Nam Dân chủ Cộng Hòa',
      'id_category': '4',
      'time': 'Năm 1945',
      'file_path':
          'assets/contents/quoc_hieu/nuoc_viet_nam_dan_chu_cong_hoa.txt',
      'image_path': 'assets/images/nuoc_viet_nam_dan_chu_cong_hoa.PNG',
      'video_path': 'https://www.youtube.com/watch?v=qmf7N72AKFw',
      'is_done': 0,
      'number': 17,
      'key_word': 'Nước Việt Nam Dân chủ Cộng Hòa, 1945',
    });
    await DBHelper.insert('content', {
      'id': '317',
      'title': 'Cộng Hòa Xã Hội Chủ Nghĩa Việt Nam',
      'id_category': '4',
      'time': 'Năm 1976',
      'file_path':
          'assets/contents/quoc_hieu/cong_hoa_xa_hoi_chu_nghia_viet_nam.txt',
      'image_path': 'assets/images/cong_hoa_xa_hoi_chu_nghia_viet_nam.PNG',
      'video_path': 'https://www.youtube.com/watch?v=gN3TZroCOv4',
      'is_done': 0,
      'number': 18,
      'key_word': 'Cộng Hòa Xã Hội Chủ Nghĩa Việt Nam, 1976',
    });
  }

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
      'sentence': 'Nhà nước nào sau đây không thuộc thời Hồng Bàn?',
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
    //Kinh Dương Vương
    await DBHelper.insert('question', {
      'id': '100',
      'sentence':
          'Ai là người hình thành nhà nước sơ khai đầu tiên vào năm Nhâm Tuất (khoảng 2879TCN)?',
      'id_content': '100',
      'number': 100,
      'answer_index': 1,
    });
    await DBHelper.insert('answer', {
      'id': '100',
      'sentence': 'Lạc Long Quân',
      'id_question': '100',
      'id_content': '100',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '101',
      'sentence': 'Kinh Dương Vương',
      'id_question': '100',
      'id_content': '100',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '102',
      'sentence': 'Âu Cơ',
      'id_question': '100',
      'id_content': '100',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '103',
      'sentence': 'Vua Thần Nông',
      'id_question': '100',
      'id_content': '100',
      'number': 3,
    });
    //Lạc Long Quân
    await DBHelper.insert('question', {
      'id': '110',
      'sentence': 'Lạc Long Quân được xem là vị vua của nhà nước sơ khai nào?',
      'id_content': '101',
      'number': 110,
      'answer_index': 0,
    });
    await DBHelper.insert('answer', {
      'id': '110',
      'sentence': 'Xích Quỷ',
      'id_question': '110',
      'id_content': '101',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '111',
      'sentence': 'Văn Lang',
      'id_question': '110',
      'id_content': '101',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '112',
      'sentence': 'Âu Lạc',
      'id_question': '110',
      'id_content': '101',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '113',
      'sentence': 'Bách Việt',
      'id_question': '110',
      'id_content': '101',
      'number': 3,
    });
    //Triệu Đà
    await DBHelper.insert('question', {
      'id': '120',
      'sentence': 'Triệu Đà xuất thân là quan võ thời nào ở Trung Hoa cổ đại?',
      'id_content': '102',
      'number': 120,
      'answer_index': 0,
    });
    await DBHelper.insert('answer', {
      'id': '120',
      'sentence': 'Nhà Tần',
      'id_question': '120',
      'id_content': '102',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '121',
      'sentence': 'Nhà Hán',
      'id_question': '120',
      'id_content': '102',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '122',
      'sentence': 'Nhà Minh',
      'id_question': '120',
      'id_content': '102',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '123',
      'sentence': 'Nhà Thanh',
      'id_question': '120',
      'id_content': '102',
      'number': 3,
    });
    //Hai bà Trưng
    await DBHelper.insert('question', {
      'id': '130',
      'sentence': 'Cuộc khởi nghĩa của hai bà Trưng chống lại quân nào?',
      'id_content': '103',
      'number': 130,
      'answer_index': 2,
    });
    await DBHelper.insert('answer', {
      'id': '130',
      'sentence': 'Quân nhà Thanh',
      'id_question': '130',
      'id_content': '103',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '131',
      'sentence': 'Quân nhà Tần',
      'id_question': '130',
      'id_content': '103',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '132',
      'sentence': 'Quân nhà Hán',
      'id_question': '130',
      'id_content': '103',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '133',
      'sentence': 'Quân nhà Ngô',
      'id_question': '130',
      'id_content': '103',
      'number': 3,
    });
    //Ngô Quyền
    await DBHelper.insert('question', {
      'id': '140',
      'sentence': 'Ngô Quyền là vị vua đầu tiên của nhà nào?',
      'id_content': '104',
      'number': 140,
      'answer_index': 3,
    });
    await DBHelper.insert('answer', {
      'id': '140',
      'sentence': 'Nhà Trần',
      'id_question': '140',
      'id_content': '104',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '141',
      'sentence': 'Nhà Lý',
      'id_question': '140',
      'id_content': '104',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '142',
      'sentence': 'Nhà Hồ',
      'id_question': '140',
      'id_content': '104',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '143',
      'sentence': 'Nhà Ngô',
      'id_question': '140',
      'id_content': '104',
      'number': 3,
    });
    //Đinh Bộ Lĩnh
    await DBHelper.insert('question', {
      'id': '150',
      'sentence':
          'Đinh Bộ Lĩnh là vị hoàng đế sáng lập nhà Đinh, đặt nên nước là gì?',
      'id_content': '105',
      'number': 150,
      'answer_index': 1,
    });
    await DBHelper.insert('answer', {
      'id': '150',
      'sentence': 'Văn Lang',
      'id_question': '150',
      'id_content': '105',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '151',
      'sentence': 'Đại Cồ Việt',
      'id_question': '150',
      'id_content': '105',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '152',
      'sentence': 'Đại Việt',
      'id_question': '150',
      'id_content': '105',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '153',
      'sentence': 'Đại Ngu',
      'id_question': '150',
      'id_content': '105',
      'number': 3,
    });
    //Lý Thái Tổ
    await DBHelper.insert('question', {
      'id': '160',
      'sentence': 'Lý Thái Tổ có tên thật là gì?',
      'id_content': '106',
      'number': 160,
      'answer_index': 2,
    });
    await DBHelper.insert('answer', {
      'id': '160',
      'sentence': 'Lý Thường Kiệt',
      'id_question': '160',
      'id_content': '106',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '161',
      'sentence': 'Lý Long Tường',
      'id_question': '160',
      'id_content': '106',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '162',
      'sentence': 'Lý Công Uẩn',
      'id_question': '160',
      'id_content': '106',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '163',
      'sentence': 'Lý Nhân Tông',
      'id_question': '160',
      'id_content': '106',
      'number': 3,
    });
    //Lý Thường Kiệt
    await DBHelper.insert('question', {
      'id': '170',
      'sentence':
          'Lý Thường Kiệt nổi tiếng việc chinh phạt trên đất nhà nào ở Trung Hoa?',
      'id_content': '107',
      'number': 170,
      'answer_index': 3,
    });
    await DBHelper.insert('answer', {
      'id': '170',
      'sentence': 'Nhà Minh',
      'id_question': '170',
      'id_content': '107',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '171',
      'sentence': 'Nhà Hán',
      'id_question': '170',
      'id_content': '107',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '172',
      'sentence': 'Nhà Đường',
      'id_question': '170',
      'id_content': '107',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '173',
      'sentence': 'Nhà Tống',
      'id_question': '170',
      'id_content': '107',
      'number': 3,
    });
    //Trần Quốc Tuấn
    await DBHelper.insert('question', {
      'id': '180',
      'sentence': 'Trần Quốc Tuấn mất vào năm bao nhiêu?',
      'id_content': '108',
      'number': 180,
      'answer_index': 3,
    });
    await DBHelper.insert('answer', {
      'id': '180',
      'sentence': '1227',
      'id_question': '180',
      'id_content': '108',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '181',
      'sentence': '1228',
      'id_question': '180',
      'id_content': '108',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '182',
      'sentence': '1229',
      'id_question': '180',
      'id_content': '108',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '183',
      'sentence': '1300',
      'id_question': '180',
      'id_content': '108',
      'number': 3,
    });
    //Lê Lợi
    await DBHelper.insert('question', {
      'id': '190',
      'sentence':
          'Lê Lợi lãnh đạo quân dân người Việt chống lại quân Minh trong khoảng thời gian nào?',
      'id_content': '109',
      'number': 190,
      'answer_index': 0,
    });
    await DBHelper.insert('answer', {
      'id': '190',
      'sentence': '10 năm (1418-1428)',
      'id_question': '190',
      'id_content': '109',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '191',
      'sentence': '9 năm (1418-1427)',
      'id_question': '190',
      'id_content': '109',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '192',
      'sentence': '10 năm (1428-1438)',
      'id_question': '190',
      'id_content': '109',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '193',
      'sentence': '9 năm (1428-1437)',
      'id_question': '190',
      'id_content': '109',
      'number': 3,
    });
    //Nguyễn Huệ
    await DBHelper.insert('question', {
      'id': '200',
      'sentence':
          'Quang Trung Hoàng đế là vị hoàng đế thứ mấy của nhà Tây Sơn?',
      'id_content': '110',
      'number': 200,
      'answer_index': 0,
    });
    await DBHelper.insert('answer', {
      'id': '200',
      'sentence': '2',
      'id_question': '200',
      'id_content': '110',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '201',
      'sentence': '3',
      'id_question': '200',
      'id_content': '110',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '202',
      'sentence': '4',
      'id_question': '200',
      'id_content': '110',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '203',
      'sentence': '5',
      'id_question': '200',
      'id_content': '110',
      'number': 3,
    });
    //Võ Nguyên Giáp
    await DBHelper.insert('question', {
      'id': '210',
      'sentence': 'Đại tướng Võ Nguyên Giáp sinh ngày nào?',
      'id_content': '111',
      'number': 210,
      'answer_index': 1,
    });
    await DBHelper.insert('answer', {
      'id': '210',
      'sentence': '25 tháng 7 năm 1911',
      'id_question': '210',
      'id_content': '111',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '211',
      'sentence': '25 tháng 8 năm 1911',
      'id_question': '210',
      'id_content': '111',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '212',
      'sentence': '25 tháng 8 năm 1912',
      'id_question': '210',
      'id_content': '111',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '213',
      'sentence': '4 tháng 10 năm 2013',
      'id_question': '210',
      'id_content': '111',
      'number': 3,
    });
    //Bảo Đại
    await DBHelper.insert('question', {
      'id': '220',
      'sentence': 'Bảo Đại là vị hoàng đế thứ mấy của triều đại nhà Nguyễn?',
      'id_content': '112',
      'number': 220,
      'answer_index': 1,
    });
    await DBHelper.insert('answer', {
      'id': '220',
      'sentence': '12',
      'id_question': '220',
      'id_content': '112',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '221',
      'sentence': '13',
      'id_question': '220',
      'id_content': '112',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '222',
      'sentence': '14',
      'id_question': '220',
      'id_content': '112',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '223',
      'sentence': '15',
      'id_question': '220',
      'id_content': '112',
      'number': 3,
    });
    //Hồ Chí Minh
    await DBHelper.insert('question', {
      'id': '230',
      'sentence':
          'Tác phẩm "Bản án chế độ thực dân Pháp" do Nguyễn Ái Quốc viết được xuất bản năm 1925 được viết bằng ngôn ngữ gì?',
      'id_content': '113',
      'number': 230,
      'answer_index': 1,
    });
    await DBHelper.insert('answer', {
      'id': '230',
      'sentence': 'Tiếng Anh',
      'id_question': '230',
      'id_content': '113',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '231',
      'sentence': 'Tiếng Pháp',
      'id_question': '230',
      'id_content': '113',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '232',
      'sentence': 'Tiếng Đức',
      'id_question': '230',
      'id_content': '113',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '233',
      'sentence': 'Tiếng Việt',
      'id_question': '230',
      'id_content': '113',
      'number': 3,
    });
    //Bạch Đằng 938
    await DBHelper.insert('question', {
      'id': '300',
      'sentence':
          'Trận Bạch Đằng năm 938 do Ngô Quyền lãnh đạo chống lại quân nhà nào?',
      'id_content': '200',
      'number': 300,
      'answer_index': 0,
    });
    await DBHelper.insert('answer', {
      'id': '300',
      'sentence': 'Nam Hán',
      'id_question': '300',
      'id_content': '200',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '301',
      'sentence': 'Bắc Hán',
      'id_question': '300',
      'id_content': '200',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '302',
      'sentence': 'Đông Hán',
      'id_question': '300',
      'id_content': '200',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '303',
      'sentence': 'Nam Hán',
      'id_question': '300',
      'id_content': '200',
      'number': 3,
    });
    //Như Nguyệt
    await DBHelper.insert('question', {
      'id': '310',
      'sentence':
          'Trận Như Nguyệt do ai lãnh đạo quân đội Đại Việt đánh đuổi nhà Tống?',
      'id_content': '201',
      'number': 310,
      'answer_index': 3,
    });
    await DBHelper.insert('answer', {
      'id': '310',
      'sentence': 'Lý Nhân Tông',
      'id_question': '310',
      'id_content': '201',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '311',
      'sentence': 'Lý Thái Tông',
      'id_question': '310',
      'id_content': '201',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '312',
      'sentence': 'Lý Phục Man',
      'id_question': '310',
      'id_content': '201',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '313',
      'sentence': 'Lý Thường Kiệt',
      'id_question': '310',
      'id_content': '201',
      'number': 3,
    });
    //Đông Bộ Đầu
    await DBHelper.insert('question', {
      'id': '320',
      'sentence':
          'Trận Đông Bộ Đầu là trận phản công chiến lược của quân đội nhà Trần, do vua nào chỉ huy?',
      'id_content': '202',
      'number': 320,
      'answer_index': 3,
    });
    await DBHelper.insert('answer', {
      'id': '320',
      'sentence': 'Trần Thánh Tông',
      'id_question': '320',
      'id_content': '202',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '321',
      'sentence': 'Trần Nhân Tông',
      'id_question': '320',
      'id_content': '202',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '322',
      'sentence': 'Trần Anh Tông',
      'id_question': '320',
      'id_content': '202',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '323',
      'sentence': 'Trần Thái Tông',
      'id_question': '320',
      'id_content': '202',
      'number': 3,
    });
    //Bạch Đằng
    await DBHelper.insert('question', {
      'id': '330',
      'sentence':
          'Sau hai lần thất bại trước đó, Hốt Tất Liệt nhận ra rằng khó khăn lớn nhất của quân Nguyên là gì?',
      'id_content': '203',
      'number': 330,
      'answer_index': 2,
    });
    await DBHelper.insert('answer', {
      'id': '330',
      'sentence': 'Vũ khí',
      'id_question': '330',
      'id_content': '203',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '331',
      'sentence': 'Quân số',
      'id_question': '330',
      'id_content': '203',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '332',
      'sentence': 'Lương thực',
      'id_question': '330',
      'id_content': '203',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '333',
      'sentence': 'Thuyền',
      'id_question': '330',
      'id_content': '203',
      'number': 3,
    });
    //Chi Lăng - Xương Giang
    await DBHelper.insert('question', {
      'id': '340',
      'sentence':
          'Đầu năm 1427 nhà Minh đã quyết định phái bao nhiêu đạo quân tiến vào lãnh thổ nước ta?',
      'id_content': '204',
      'number': 340,
      'answer_index': 2,
    });
    await DBHelper.insert('answer', {
      'id': '340',
      'sentence': '4',
      'id_question': '340',
      'id_content': '204',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '341',
      'sentence': '3',
      'id_question': '340',
      'id_content': '204',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '342',
      'sentence': '2',
      'id_question': '340',
      'id_content': '204',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '343',
      'sentence': '1',
      'id_question': '340',
      'id_content': '204',
      'number': 3,
    });
    //Rạch Gầm - Xoài Mút
    await DBHelper.insert('question', {
      'id': '350',
      'sentence': 'Quân Xiêm bắt đầu kéo vào nước ta thời gian nào?',
      'id_content': '205',
      'number': 350,
      'answer_index': 1,
    });
    await DBHelper.insert('answer', {
      'id': '350',
      'sentence': 'Tháng 6, năm 1784',
      'id_question': '350',
      'id_content': '205',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '351',
      'sentence': 'Tháng 7, năm 1784',
      'id_question': '350',
      'id_content': '205',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '352',
      'sentence': 'Tháng 8, năm 1784',
      'id_question': '350',
      'id_content': '205',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '353',
      'sentence': 'Tháng 7, năm 1785',
      'id_question': '350',
      'id_content': '205',
      'number': 3,
    });
    //Ngọc Hồi - Đống Đa
    await DBHelper.insert('question', {
      'id': '360',
      'sentence': 'Trận Ngọc Hồi Đống Đa còn có tên gọi nào khác?',
      'id_content': '206',
      'number': 360,
      'answer_index': 1,
    });
    await DBHelper.insert('answer', {
      'id': '360',
      'sentence': 'Chiến thắng Mậu Thân',
      'id_question': '360',
      'id_content': '206',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '361',
      'sentence': 'Chiến thắng Kỷ Dậu',
      'id_question': '360',
      'id_content': '206',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '362',
      'sentence': 'Chiến thắng Nhâm Tuất',
      'id_question': '360',
      'id_content': '206',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '363',
      'sentence': 'Chiến thắng Canh Thìn',
      'id_question': '360',
      'id_content': '206',
      'number': 3,
    });
    //Chiến dịch ĐBP
    await DBHelper.insert('question', {
      'id': '370',
      'sentence': 'Trận Điện Biên Phủ diễn ra ở đâu?',
      'id_content': '207',
      'number': 370,
      'answer_index': 3,
    });
    await DBHelper.insert('answer', {
      'id': '370',
      'sentence': 'Hà Nội',
      'id_question': '370',
      'id_content': '207',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '371',
      'sentence': 'Gia Định',
      'id_question': '370',
      'id_content': '207',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '372',
      'sentence': 'Thanh Hóa',
      'id_question': '370',
      'id_content': '207',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '373',
      'sentence': 'Điện Biên',
      'id_question': '370',
      'id_content': '207',
      'number': 3,
    });
    //ĐBP trên không
    await DBHelper.insert('question', {
      'id': '380',
      'sentence':
          'Ngày bao nhiêu Ních xơn buộc ra lệnh ngừng ném bom từ vĩ tuyến 20 trở ra và họp lại Hội nghị Paris về Việt Nam?',
      'id_content': '208',
      'number': 380,
      'answer_index': 2,
    });
    await DBHelper.insert('answer', {
      'id': '380',
      'sentence': '5 giờ sáng ngày 30/12/1972',
      'id_question': '380',
      'id_content': '208',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '381',
      'sentence': '6 giờ sáng ngày 30/12/1972',
      'id_question': '380',
      'id_content': '208',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '382',
      'sentence': '7 giờ sáng ngày 30/12/1972',
      'id_question': '380',
      'id_content': '208',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '383',
      'sentence': '8 giờ sáng ngày 30/12/1972',
      'id_question': '380',
      'id_content': '208',
      'number': 3,
    });
    //Chiến dịch HCM
    await DBHelper.insert('question', {
      'id': '390',
      'sentence':
          'Cuộc Tổng tiến công và nổi dậy mùa xuân năm 1975 có bao nhiêu đòn tiến công chiến lược?',
      'id_content': '209',
      'number': 390,
      'answer_index': 0,
    });
    await DBHelper.insert('answer', {
      'id': '390',
      'sentence': '3',
      'id_question': '390',
      'id_content': '209',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '391',
      'sentence': '4',
      'id_question': '390',
      'id_content': '209',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '392',
      'sentence': '5',
      'id_question': '390',
      'id_content': '209',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '393',
      'sentence': '6',
      'id_question': '390',
      'id_content': '209',
      'number': 3,
    });
    //Họ Hồng Bàn
    await DBHelper.insert('question', {
      'id': '400',
      'sentence':
          '1.	Sau khi Hùng Vương lên ngôi đặt quốc hiệu(tên nước) là gì?',
      'id_content': '300',
      'number': 400,
      'answer_index': 1,
    });
    await DBHelper.insert('answer', {
      'id': '400',
      'sentence': 'Âu Lạc',
      'id_question': '400',
      'id_content': '300',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '401',
      'sentence': 'Văn Lang',
      'id_question': '400',
      'id_content': '300',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '402',
      'sentence': 'Lạc Việt',
      'id_question': '400',
      'id_content': '300',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '403',
      'sentence': 'Hùng Vương',
      'id_question': '400',
      'id_content': '300',
      'number': 3,
    });
    //Nhà Thục
    await DBHelper.insert('question', {
      'id': '410',
      'sentence':
          '1.	Ai là người đã đánh bại Hùng Vương và cải quốc hiệu thành Âu Lạc?',
      'id_content': '301',
      'number': 410,
      'answer_index': 0,
    });
    await DBHelper.insert('answer', {
      'id': '410',
      'sentence': 'Thục Phán',
      'id_question': '410',
      'id_content': '301',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '411',
      'sentence': 'Đồ Thư',
      'id_question': '410',
      'id_content': '301',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '412',
      'sentence': 'Cao Lỗ',
      'id_question': '410',
      'id_content': '301',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '413',
      'sentence': 'Trọng Thủy',
      'id_question': '410',
      'id_content': '301',
      'number': 3,
    });
    //Nhà Triệu
    await DBHelper.insert('question', {
      'id': '420',
      'sentence':
          'Lịch sử tồn tại của hà Triệu bao nhiêu năm và trải qua mấy đời vua?',
      'id_content': '302',
      'number': 420,
      'answer_index': 0,
    });
    await DBHelper.insert('answer', {
      'id': '420',
      'sentence': 'Tồn tại 97 năm (207-111 TCN) và trải qua 5 đời vua.',
      'id_question': '420',
      'id_content': '302',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '421',
      'sentence': 'Tồn tại 90 năm (207-118 TCN) và trải qua 5 đời vua.',
      'id_question': '420',
      'id_content': '302',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '422',
      'sentence': 'Tồn tại 66 năm (203-137 TCN) và trải qua 3 đời vua.',
      'id_question': '420',
      'id_content': '302',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '423',
      'sentence': 'Tồn tại 26 năm (137-111 TCN) và trải qua 3 đời vua.',
      'id_question': '420',
      'id_content': '302',
      'number': 3,
    });
    //Trưng Nữ Vương
    await DBHelper.insert('question', {
      'id': '430',
      'sentence':
          'Ai là người thủ lĩnh khởi chống lại chinh quyền đô hộ của Đông Hán?',
      'id_content': '303',
      'number': 430,
      'answer_index': 3,
    });
    await DBHelper.insert('answer', {
      'id': '430',
      'sentence': 'Trưng Trắc',
      'id_question': '430',
      'id_content': '303',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '431',
      'sentence': 'Trưng Nhị',
      'id_question': '430',
      'id_content': '303',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '432',
      'sentence': 'Trưng Nữ Vương',
      'id_question': '430',
      'id_content': '303',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '433',
      'sentence': 'Trưng Trắc và Trưng Nhị',
      'id_question': '430',
      'id_content': '303',
      'number': 3,
    });
    //Nhà tiền Lý và nhà Triệu
    await DBHelper.insert('question', {
      'id': '440',
      'sentence':
          'Người có công đánh bại nhà Lương sau khi Lý Nam Đế mất và thành lập nên nhà Triệu là ai?',
      'id_content': '304',
      'number': 440,
      'answer_index': 3,
    });
    await DBHelper.insert('answer', {
      'id': '440',
      'sentence': 'Lý Thiên Bảo',
      'id_question': '440',
      'id_content': '304',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '441',
      'sentence': 'Trần Bá Tiên',
      'id_question': '440',
      'id_content': '304',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '442',
      'sentence': 'Triệu Tử Long',
      'id_question': '440',
      'id_content': '304',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '443',
      'sentence': 'Triệu Quang Phục',
      'id_question': '440',
      'id_content': '304',
      'number': 3,
    });
    //Triều Ngô
    await DBHelper.insert('question', {
      'id': '450',
      'sentence':
          'Trận đánh làm nên lịch sử của Triều Ngô là gì? Do ai đứng đầu?',
      'id_content': '305',
      'number': 450,
      'answer_index': 1,
    });
    await DBHelper.insert('answer', {
      'id': '450',
      'sentence': 'Chiến thắng quân Lương ở Cổ Loa , do Ngô Quyền đứng đầu.',
      'id_question': '450',
      'id_content': '305',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '451',
      'sentence':
          'Đại phá quân Nam Hán trên Sông Bạch Đằng, do Ngô Quyền đứng đầu.',
      'id_question': '450',
      'id_content': '305',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '452',
      'sentence': 'Cuộc lật đổ Dương Nam Kha, do Ngô Xương Ngập lãnh đạo.',
      'id_question': '450',
      'id_content': '305',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '453',
      'sentence':
          'Đánh bại quân của Kiều Công Tiền và quân đồng Minh là Nam Hán, do Ngô Xương Văn lanh đạo.',
      'id_question': '450',
      'id_content': '305',
      'number': 3,
    });
    //Nhà Đinh
    await DBHelper.insert('question', {
      'id': '460',
      'sentence': 'Sự kiện lịch sử Năm Mậu Thìn (986) là gì?',
      'id_content': '306',
      'number': 460,
      'answer_index': 0,
    });
    await DBHelper.insert('answer', {
      'id': '460',
      'sentence':
          'Đinh Bộ Lĩnh dẹp loạn 12 sứ quân, thống nhất đất nước và lên ngôi hoàng đế.',
      'id_question': '460',
      'id_content': '306',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '461',
      'sentence': 'Đinh Phế Đế nhường ngôi cho Lê Hoàn.',
      'id_question': '460',
      'id_content': '306',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '462',
      'sentence': 'Đinh Phế Đế (con trai của Đinh Bộ Lĩnh) lên ngôi.',
      'id_question': '460',
      'id_content': '306',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '463',
      'sentence': 'Đinh Bộ Lĩnh ban hành và quy định bộ máy nhà nước',
      'id_question': '460',
      'id_content': '306',
      'number': 3,
    });
    //Nhà Tiền Lê
    await DBHelper.insert('question', {
      'id': '470',
      'sentence': 'Đâu là lý do Nhà Tống xâm lược nước ta?',
      'id_content': '307',
      'number': 470,
      'answer_index': 3,
    });
    await DBHelper.insert('answer', {
      'id': '470',
      'sentence': 'Bộ máy nhà nước yếu kém.',
      'id_question': '470',
      'id_content': '307',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '471',
      'sentence': 'Đinh Tiên Hoàng bị sát hại.',
      'id_question': '470',
      'id_content': '307',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '472',
      'sentence': 'Nội chiến trong cung đình.',
      'id_question': '470',
      'id_content': '307',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '473',
      'sentence':
          'Đinh Tiên Hoàng bị sát hại và Đinh Toản lên ngôi vua khi mới 6 tuổi.',
      'id_question': '470',
      'id_content': '307',
      'number': 3,
    });
    //Nhà Lý
    await DBHelper.insert('question', {
      'id': '480',
      'sentence': 'Vị vua nào đã lập ra Vương triều nhà Lý?',
      'id_content': '308',
      'number': 480,
      'answer_index': 1,
    });
    await DBHelper.insert('answer', {
      'id': '480',
      'sentence': 'Lý Chiêu Hoàng',
      'id_question': '480',
      'id_content': '308',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '481',
      'sentence': 'Lý Thái Tổ',
      'id_question': '480',
      'id_content': '308',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '482',
      'sentence': 'Lý Nhân Tông',
      'id_question': '480',
      'id_content': '308',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '483',
      'sentence': 'Lý Thường Kiệt',
      'id_question': '480',
      'id_content': '308',
      'number': 3,
    });
    //Nhà Trần
    await DBHelper.insert('question', {
      'id': '490',
      'sentence': 'Lý do khởi nghiệp của Triều đại nhà Trần?',
      'id_content': '309',
      'number': 490,
      'answer_index': 3,
    });
    await DBHelper.insert('answer', {
      'id': '490',
      'sentence': 'Vua Lý Thái Tổ mất và nhường ngôi cho Trần Cảnh.',
      'id_question': '490',
      'id_content': '309',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '491',
      'sentence': 'Trần Cảnh đứng lên khởi nghĩa và đánh bại là Lý.',
      'id_question': '490',
      'id_content': '309',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '492',
      'sentence':
          'Sau khi vị vua cuối cùng của nhà Lý mất và truyền cho tướng Trần Cảnh kế vị. ',
      'id_question': '490',
      'id_content': '309',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '493',
      'sentence':
          'Lý Chiêu Hoàng nhường ngôi cho chồng là Trần Cảnh (Trần Thái Tông).',
      'id_question': '490',
      'id_content': '309',
      'number': 3,
    });
    //Nhà Hồ
    await DBHelper.insert('question', {
      'id': '500',
      'sentence': 'Tại sao nhà Hồ chỉ tồn tại 7 năm?',
      'id_content': '310',
      'number': 500,
      'answer_index': 3,
    });
    await DBHelper.insert('answer', {
      'id': '500',
      'sentence': '30/04/1975',
      'id_question': '500',
      'id_content': '310',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '501',
      'sentence': '02/09/1945',
      'id_question': '500',
      'id_content': '310',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '502',
      'sentence': '20/07/1954',
      'id_question': '500',
      'id_content': '310',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '503',
      'sentence': '07/05/1954',
      'id_question': '500',
      'id_content': '310',
      'number': 3,
    });
    //Triều Lê Sơ
    await DBHelper.insert('question', {
      'id': '510',
      'sentence':
          'Triều Lê Sơ tồn tại bao nhiêu năm và trải qua bao nhiêu đời vua?',
      'id_content': '311',
      'number': 510,
      'answer_index': 3,
    });
    await DBHelper.insert('answer', {
      'id': '510',
      'sentence': '100 năm và 10 đời vua.',
      'id_question': '510',
      'id_content': '311',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '511',
      'sentence': '60 năm và 8 đời vua.',
      'id_question': '510',
      'id_content': '311',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '512',
      'sentence': '175 năm và 12 đời vua.',
      'id_question': '510',
      'id_content': '311',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '513',
      'sentence': '99 năm và 10 đời vua.',
      'id_question': '510',
      'id_content': '311',
      'number': 3,
    });
    //Nhà Mạc
    await DBHelper.insert('question', {
      'id': '520',
      'sentence': 'Ai là người thành lập ra nhà Mạc?',
      'id_content': '312',
      'number': 520,
      'answer_index': 1,
    });
    await DBHelper.insert('answer', {
      'id': '520',
      'sentence': 'Mạc Đĩnh Chi',
      'id_question': '520',
      'id_content': '312',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '521',
      'sentence': 'Mạc Đăng Dung',
      'id_question': '520',
      'id_content': '312',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '522',
      'sentence': 'Mạc Mậu Hợp',
      'id_question': '520',
      'id_content': '312',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '523',
      'sentence': 'Mạc Kính Chỉ',
      'id_question': '520',
      'id_content': '312',
      'number': 3,
    });
    //Triều Hậu Lê
    await DBHelper.insert('question', {
      'id': '530',
      'sentence': 'Lê Trang Tông là ai?',
      'id_content': '313',
      'number': 530,
      'answer_index': 0,
    });
    await DBHelper.insert('answer', {
      'id': '530',
      'sentence': 'Con trai Vua Lê Chiêu Tông.',
      'id_question': '530',
      'id_content': '313',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '531',
      'sentence': 'Cháu đời thứ nhất của vua Lê Thánh Tông.',
      'id_question': '530',
      'id_content': '313',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '532',
      'sentence': 'Con trai Vua Lê Thái Tông.',
      'id_question': '530',
      'id_content': '313',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '533',
      'sentence': '	Người kế vị của họ Lê.',
      'id_question': '530',
      'id_content': '313',
      'number': 3,
    });
    //Nhà Tây Sơn
    await DBHelper.insert('question', {
      'id': '540',
      'sentence': 'Vua Quang Trung lên ngôi năm nào, ở đâu?',
      'id_content': '314',
      'number': 540,
      'answer_index': 2,
    });
    await DBHelper.insert('answer', {
      'id': '540',
      'sentence': '1792, Huế.',
      'id_question': '540',
      'id_content': '314',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '541',
      'sentence': '1789, Thăng Long',
      'id_question': '540',
      'id_content': '314',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '542',
      'sentence': '1788, Huế.',
      'id_question': '540',
      'id_content': '314',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '543',
      'sentence': '1788, Thăng Long',
      'id_question': '540',
      'id_content': '314',
      'number': 3,
    });
    //Nhà Nguyễn
    await DBHelper.insert('question', {
      'id': '550',
      'sentence':
          'Ai là người đanh bại nhà Tây Sơn, thành lập nhà Nguyễn và tên nước sau khi thành lập?',
      'id_content': '315',
      'number': 550,
      'answer_index': 2,
    });
    await DBHelper.insert('answer', {
      'id': '550',
      'sentence': 'Minh Mạng, Đại Nam.',
      'id_question': '550',
      'id_content': '315',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '551',
      'sentence': 'Bảo Đại, Việt Nam.',
      'id_question': '550',
      'id_content': '315',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '552',
      'sentence': 'Nguyễn Phúc Ánh(Gia Long), Việt Nam.',
      'id_question': '550',
      'id_content': '315',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '553',
      'sentence': 'Tự Đức, Đại Nam.',
      'id_question': '550',
      'id_content': '315',
      'number': 3,
    });
    //Nước VNDCCH
    await DBHelper.insert('question', {
      'id': '560',
      'sentence': 'Đảng cộng sản Đông Dương ra đời năm nào?',
      'id_content': '316',
      'number': 560,
      'answer_index': 0,
    });
    await DBHelper.insert('answer', {
      'id': '560',
      'sentence': '03/02/1930',
      'id_question': '560',
      'id_content': '316',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '561',
      'sentence': '02/09/1945',
      'id_question': '560',
      'id_content': '316',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '562',
      'sentence': '30/04/1930',
      'id_question': '560',
      'id_content': '316',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '563',
      'sentence': '19/05/1954',
      'id_question': '560',
      'id_content': '316',
      'number': 3,
    });
    //Nước CHXHCNVN
    await DBHelper.insert('question', {
      'id': '570',
      'sentence':
          'Kì họp thứ nhất của Quốc hội khoa VI diễn ra ngày nào, nội dung chính?',
      'id_content': '317',
      'number': 570,
      'answer_index': 0,
    });
    await DBHelper.insert('answer', {
      'id': '570',
      'sentence':
          '2-7-1976, Quyết định đặt tên nước là CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM.',
      'id_question': '570',
      'id_content': '317',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '571',
      'sentence': '2-7-1975, Nhất trí lấy HÀ NỘI là THỦ ĐÔ của cả nước.',
      'id_question': '570',
      'id_content': '317',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '572',
      'sentence':
          '2-5-1976, Quyết định đặt tên nước là CỘNG HÒA XÃ HỘI CHỦ NGHĨA VIỆT NAM.',
      'id_question': '570',
      'id_content': '317',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '573',
      'sentence': 'Cả 3 đáp án đều sai.',
      'id_question': '570',
      'id_content': '317',
      'number': 3,
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
      'sentence': 'Xích Quỷ',
      'id_question': '2',
      'id_content': '2',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '6',
      'sentence': 'Nhà Hồ',
      'id_question': '2',
      'id_content': '2',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '7',
      'sentence': 'Nhà Thục',
      'id_question': '2',
      'id_content': '2',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '8',
      'sentence': 'Văn Lang',
      'id_question': '2',
      'id_content': '2',
      'number': 3,
    });
    //Câu hỏi 3
    await DBHelper.insert('answer', {
      'id': '9',
      'sentence': '7 quận',
      'id_question': '3',
      'id_content': '3',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '10',
      'sentence': '8 quận',
      'id_question': '3',
      'id_content': '3',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '11',
      'sentence': '9 quận',
      'id_question': '3',
      'id_content': '3',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '12',
      'sentence': '10 quận',
      'id_question': '3',
      'id_content': '3',
      'number': 3,
    });
    //Câu hỏi 4
    await DBHelper.insert('answer', {
      'id': '13',
      'sentence': 'Năm 544',
      'id_question': '4',
      'id_content': '4',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '14',
      'sentence': 'Năm 248',
      'id_question': '4',
      'id_content': '4',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '15',
      'sentence': 'Năm 542',
      'id_question': '4',
      'id_content': '4',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '16',
      'sentence': 'Năm 546',
      'id_question': '4',
      'id_content': '4',
      'number': 3,
    });
    //Câu hỏi 5
    await DBHelper.insert('answer', {
      'id': '17',
      'sentence': 'Nhà Đinh',
      'id_question': '5',
      'id_content': '5',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '18',
      'sentence': 'Nhà Tiền Lê',
      'id_question': '5',
      'id_content': '5',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '19',
      'sentence': 'Nhà Lý',
      'id_question': '5',
      'id_content': '5',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '20',
      'sentence': 'Nhà Trần',
      'id_question': '5',
      'id_content': '5',
      'number': 3,
    });
    //Câu hỏi 6
    await DBHelper.insert('answer', {
      'id': '21',
      'sentence': 'Năm 1413',
      'id_question': '6',
      'id_content': '6',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '22',
      'sentence': 'Năm 1414',
      'id_question': '6',
      'id_content': '6',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '23',
      'sentence': 'Năm 1415',
      'id_question': '6',
      'id_content': '6',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '24',
      'sentence': 'Năm 1416',
      'id_question': '6',
      'id_content': '6',
      'number': 3,
    });
    //Câu hỏi 7
    await DBHelper.insert('answer', {
      'id': '25',
      'sentence': 'Lê Thái Tổ',
      'id_question': '7',
      'id_content': '7',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '26',
      'sentence': 'Lê Thái Tông',
      'id_question': '7',
      'id_content': '7',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '27',
      'sentence': 'Lê Nhân Tông',
      'id_question': '7',
      'id_content': '7',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '28',
      'sentence': 'Lê Thánh Tông',
      'id_question': '7',
      'id_content': '7',
      'number': 3,
    });
    //Câu hỏi 8
    await DBHelper.insert('answer', {
      'id': '29',
      'sentence': 'Lê Duy Huyên',
      'id_question': '8',
      'id_content': '8',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '30',
      'sentence': 'Nguyễn Kim',
      'id_question': '8',
      'id_content': '8',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '31',
      'sentence': 'Mạc Đăng Doanh',
      'id_question': '8',
      'id_content': '8',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '32',
      'sentence': 'Mạc Đăng Dung',
      'id_question': '8',
      'id_content': '8',
      'number': 3,
    });
    //Câu hỏi 9
    await DBHelper.insert('answer', {
      'id': '33',
      'sentence': 'Nguyễn Phúc Thái(Nghĩa vương)',
      'id_question': '9',
      'id_content': '9',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '34',
      'sentence': 'Nguyễn Phúc Tần(Hiền vương)',
      'id_question': '9',
      'id_content': '9',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '35',
      'sentence': 'Nguyễn Phúc Lan(Thượng vương)',
      'id_question': '9',
      'id_content': '9',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '36',
      'sentence': 'Nguyễn Phúc Nguyên(Sãi vương)',
      'id_question': '9',
      'id_content': '9',
      'number': 3,
    });
    //Câu hỏi 10
    await DBHelper.insert('answer', {
      'id': '37',
      'sentence': 'Năm 1792',
      'id_question': '10',
      'id_content': '10',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '38',
      'sentence': 'Năm 1802',
      'id_question': '10',
      'id_content': '10',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '39',
      'sentence': 'Năm 1803',
      'id_question': '10',
      'id_content': '10',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '40',
      'sentence': 'Năm 1804',
      'id_question': '10',
      'id_content': '10',
      'number': 3,
    });
    //Câu hỏi 11
    await DBHelper.insert('answer', {
      'id': '41',
      'sentence': 'Năm 1850',
      'id_question': '11',
      'id_content': '11',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '42',
      'sentence': 'Năm 1858',
      'id_question': '11',
      'id_content': '11',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '43',
      'sentence': 'Năm 1862',
      'id_question': '11',
      'id_content': '11',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '44',
      'sentence': 'Năm 1867',
      'id_question': '11',
      'id_content': '11',
      'number': 3,
    });
    //Câu hỏi 12
    await DBHelper.insert('answer', {
      'id': '45',
      'sentence': 'Hàm Nghi',
      'id_question': '12',
      'id_content': '12',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '46',
      'sentence': 'Khải Định',
      'id_question': '12',
      'id_content': '12',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '47',
      'sentence': 'Bảo Đại',
      'id_question': '12',
      'id_content': '12',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '48',
      'sentence': 'Thành Thái',
      'id_question': '12',
      'id_content': '12',
      'number': 3,
    });
    //Câu hỏi 13
    await DBHelper.insert('answer', {
      'id': '49',
      'sentence': '30/04/1975',
      'id_question': '13',
      'id_content': '13',
      'number': 0,
    });
    await DBHelper.insert('answer', {
      'id': '50',
      'sentence': '02/09/1945',
      'id_question': '13',
      'id_content': '13',
      'number': 1,
    });
    await DBHelper.insert('answer', {
      'id': '51',
      'sentence': '20/07/1954',
      'id_question': '13',
      'id_content': '13',
      'number': 2,
    });
    await DBHelper.insert('answer', {
      'id': '52',
      'sentence': '07/05/1954',
      'id_question': '13',
      'id_content': '13',
      'number': 3,
    });
  }
}
