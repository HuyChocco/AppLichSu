import 'package:hisapp/models/HisEvent.dart';
import 'package:flutter/material.dart';

class HisEventProvider extends ChangeNotifier {
  List<HisEvent> _list_event = [
    HisEvent(
      id: '1',
      title: "Thời tiền sử",
      id_category: "1",
      filePath:
          "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_tiền_sử",
      isDone: 0,
      index: 1,
    ),
    HisEvent(
      id: '2',
      title: "Thời Hồng Bàng",
      id_category: "1",
      filePath:
          "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_tiền_sử",
      isDone: 0,
      index: 2,
    ),
    HisEvent(
      id: '3',
      title: "Thời Bắc thuộc lần I",
      id_category: "1",
      filePath:
          "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_tiền_sử",
      isDone: 0,
      index: 3,
    ),
    HisEvent(
      id: '4',
      title: "Thời kỳ Bắc thuộc lần II",
      id_category: "1",
      filePath:
          "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_tiền_sử",
      isDone: 0,
      index: 4,
    ),
    HisEvent(
      id: '5',
      title: "Thời kỳ Bắc thuộc lần III",
      id_category: "1",
      filePath:
          "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_tiền_sử",
      isDone: 0,
      index: 5,
    ),
    HisEvent(
      id: '6',
      title: "Thời kỳ độc lập tự chủ",
      id_category: "1",
      filePath:
          "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_tiền_sử",
      isDone: 0,
      index: 6,
    ),
    HisEvent(
      id: '7',
      title: "Thời kỳ Bắc Thuộc lần IV",
      id_category: "1",
      filePath:
          "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_tiền_sử",
      isDone: 0,
      index: 7,
    ),
    HisEvent(
      id: '8',
      title: "Nhà Nguyễn – Thời kỳ độc lập tự chủ",
      id_category: "1",
      filePath:
          "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_tiền_sử",
      isDone: 0,
      index: 8,
    ),
    HisEvent(
      id: '9',
      title: "Nhà Nguyễn – Thời kỳ Pháp thuộc",
      id_category: "1",
      filePath:
          "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_tiền_sử",
      isDone: 0,
      index: 9,
    ),
    HisEvent(
      id: '10',
      title: "Thời kỳ đổi mới",
      id_category: "1",
      filePath:
          "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_tiền_sử",
      isDone: 0,
      index: 10,
    ),
  ];

  List<HisEvent> get Events {
    return [..._list_event];
  }
}
