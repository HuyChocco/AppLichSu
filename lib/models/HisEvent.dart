import 'package:flutter/material.dart';
import '../models/User.dart';

class HisEvent {
  final String name, image;
  final String date;
  //final List<User> users;
  final String url;
  HisEvent({
    //@required this.users,
    @required this.name,
    @required this.image,
    @required this.date,
    @required this.url,
  });
}
