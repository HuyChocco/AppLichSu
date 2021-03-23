import 'package:flutter/material.dart';

class HisEvent {
  final String id;
  final String id_category;
  final String title;
  final String filePath;
  final String imagePath;
  final int isDone;
  final int number;
  HisEvent({
    @required this.id,
    @required this.id_category,
    @required this.title,
    @required this.filePath,
    @required this.imagePath,
    @required this.isDone,
    @required this.number,
  });
}
