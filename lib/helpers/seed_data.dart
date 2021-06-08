import 'package:hisapp/helpers/db_helper.dart';

class SeedData {
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
      'time': '2919 TCN-2792 TCN',
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
      'time': 'Khoảng thế kỷ 8-7 TCN',
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
      'time': '257 TCN - 137 TCN',
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
      'time': '22 tháng 3 năm 924 - tháng 10 năm 979',
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
      'time': '8 tháng 3 năm 974 – 31 tháng 3 năm 1028',
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
      'time': '? - 20 tháng 8, 1300',
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
      'time': '10 tháng 9, 13852 – 5 tháng 10, 1433',
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
      'time': '25 tháng 8 năm 1911 – 4 tháng 10 năm 2013',
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
      'time': '22 tháng 10 năm 1913 – 31 tháng 7 năm 1997',
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
      'title': 'Họ Hồng Bàn',
      'id_category': '4',
      'time': '2879 TCN',
      'file_path': 'assets/contents/tran_danh/song_bach_dang.txt',
      'image_path': 'assets/images/bach_dang.jpg',
      'video_path': 'https://www.youtube.com/watch?v=SIO3T0Yli3g',
      'is_done': 0,
      'number': 1,
      'key_word': 'Họ Hồng Bàn',
    });
    await DBHelper.insert('content', {
      'id': '301',
      'title': 'Nhà Thục',
      'id_category': '4',
      'time': '257 TCN',
      'file_path': 'assets/contents/tran_danh/song_bach_dang.txt',
      'image_path': 'assets/images/bach_dang.jpg',
      'video_path': 'https://www.youtube.com/watch?v=SIO3T0Yli3g',
      'is_done': 0,
      'number': 2,
      'key_word': 'Nhà Thục',
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
