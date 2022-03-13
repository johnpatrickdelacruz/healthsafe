import 'package:flutter/src/widgets/framework.dart';

class DistanceModel {
  String kilometer;
  String date;
  String id;

  DistanceModel(
      {required this.kilometer, required this.date, required this.id});

  factory DistanceModel.fromSnapshot(Map<String, dynamic> json, id) =>
      DistanceModel(id: id, kilometer: json['kilometer'], date: json['date']);
}
