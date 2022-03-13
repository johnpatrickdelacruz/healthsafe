import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:healthsafe/bloc/distance_list/distance_list_event.dart';
import 'package:healthsafe/model/distance_model.dart';

abstract class DistanceRepositoryProviding {
  Future<String> addDistance({@required kilometer});

  Future<List<DistanceModel>> getDistanceList();

  Stream<QuerySnapshot> getStreamDistanceList();

  Future<dynamic> deleteDistanceById({@required id});
}
