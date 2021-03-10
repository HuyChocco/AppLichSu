import 'package:flutter/material.dart';
import '../models/User.dart';

class TravelSpot {
  final String name, image;
  final String date;
  final List<User> users;
  final String url;
  TravelSpot({
    @required this.users,
    @required this.name,
    @required this.image,
    @required this.date,
    @required this.url,
  });
}

List<TravelSpot> travelSpots = [
  TravelSpot(
    users: users..shuffle(),
    name: "Thời kỳ tiền sử",
    image: "assets/images/Red_Mountains.png",
    date: "",
    url: "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_tiền_sử",
  ),
  TravelSpot(
    users: users..shuffle(),
    name: "Thời kỳ cổ đại",
    image: "assets/images/Magical_World.png",
    date: "2879-111 TCN",
    url:
        "https://vi.wikipedia.org/wiki/Lịch_sử_Việt_Nam#Thời_kỳ_cổ_đại_(2879–111_TCN)",
  ),
  TravelSpot(
    users: users..shuffle(),
    name: "Thời kỳ Bắc thuộc",
    image: "assets/images/Red_Mountains.png",
    date: "179 TCN-938",
    url:
        "https://vi.wikipedia.org/wiki/L%E1%BB%8Bch_s%E1%BB%AD_Vi%E1%BB%87t_Nam#Th%E1%BB%9Di_k%E1%BB%B3_B%E1%BA%AFc_thu%E1%BB%99c_(179_TCN%E2%80%93938)",
  ),
  TravelSpot(
    users: users..shuffle(),
    name: "Thời kỳ quân chủ",
    image: "assets/images/Red_Mountains.png",
    date: "938-1945",
    url:
        "https://vi.wikipedia.org/wiki/L%E1%BB%8Bch_s%E1%BB%AD_Vi%E1%BB%87t_Nam#Th%E1%BB%9Di_k%E1%BB%B3_qu%C3%A2n_ch%E1%BB%A7_(939%E2%80%931945)",
  ),
  TravelSpot(
    users: users..shuffle(),
    name: "Thời kỳ hiện đại",
    image: "assets/images/Red_Mountains.png",
    date: "1858-nay",
    url:
        "https://vi.wikipedia.org/wiki/L%E1%BB%8Bch_s%E1%BB%AD_Vi%E1%BB%87t_Nam#Th%E1%BB%9Di_k%E1%BB%B3_hi%E1%BB%87n_%C4%91%E1%BA%A1i_(1858%E2%80%93nay)",
  ),
];

List<User> users = [user1, user2, user3];
