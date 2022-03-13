import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/src/widgets/async.dart';
import 'package:healthsafe/model/distance_model.dart';
import 'package:intl/intl.dart';

List<DistanceModel>? parseSnapshot(
    AsyncSnapshot<QuerySnapshot<Object?>> snapshot) {
  return snapshot.data?.docs.map((doc) {
    return DistanceModel.fromSnapshot(
        doc.data() as Map<String, dynamic>, doc.id);
  }).toList();
}

String dateFormat(String date) {
  DateTime dt = DateTime.parse(date);
  final DateFormat formatter = DateFormat('MMM d, h:mm a');
  return formatter.format(dt);
}
