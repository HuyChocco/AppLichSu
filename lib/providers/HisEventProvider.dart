import 'package:hisapp/models/HisEvent.dart';

class HisEventProvider {
  List<HisEvent> _list_event = [
    HisEvent(
      name: "Thời kỳ tiền sử",
      image: "assets/images/Red_Mountains.png",
      url: "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_tiền_sử",
    ),
    HisEvent(
      name: "Thời kỳ cổ đại",
      image: "assets/images/Magical_World.png",
      url:
          "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_cổ_đại_(2879–111_TCN)",
    ),
    HisEvent(
      name: "Thời kỳ Bắc thuộc",
      image: "assets/images/Red_Mountains.png",
      url:
          "https://vi.wikipedia.org/wiki/L%E1%BB%8Bch_s%E1%BB%AD_Vi%E1%BB%87t_Nam#Th%E1%BB%9Di_k%E1%BB%B3_B%E1%BA%AFc_thu%E1%BB%99c_(179_TCN%E2%80%93938)",
    ),
    HisEvent(
      name: "Thời kỳ quân chủ",
      image: "assets/images/Red_Mountains.png",
      url:
          "https://vi.wikipedia.org/wiki/L%E1%BB%8Bch_s%E1%BB%AD_Vi%E1%BB%87t_Nam#Th%E1%BB%9Di_k%E1%BB%B3_qu%C3%A2n_ch%E1%BB%A7_(939%E2%80%931945)",
    ),
    HisEvent(
      name: "Thời kỳ hiện đại",
      image: "assets/images/Red_Mountains.png",
      url:
          "https://vi.wikipedia.org/wiki/L%E1%BB%8Bch_s%E1%BB%AD_Vi%E1%BB%87t_Nam#Th%E1%BB%9Di_k%E1%BB%B3_hi%E1%BB%87n_%C4%91%E1%BA%A1i_(1858%E2%80%93nay)",
    ),
  ];

  List<HisEvent> get Events {
    return [..._list_event];
  }
}
