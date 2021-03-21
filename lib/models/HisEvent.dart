import 'package:flutter/material.dart';

class HisEvent {
  final String id;
  final String id_category;
  final String title;
  final String filePath;
  final isDone;
  final int index;
  HisEvent({
    @required this.id,
    @required this.id_category,
    @required this.title,
    @required this.filePath,
    @required this.isDone,
    @required this.index,
  });
}
