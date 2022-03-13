import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthsafe/model/distance_model.dart';
import 'package:healthsafe/network/abstract_repositories/distance_repository_providing.dart';

import 'package:healthsafe/network/services/distance_service.dart';

import '../../locator.dart';

class DistanceRepository extends DistanceRepositoryProviding {
  final DistanceService _distanceService = serviceLocator<DistanceService>();

  @override
  Future<String> addDistance({kilometer}) async =>
      await _distanceService.addDistance(kilometer: kilometer);

  @override
  Future<List<DistanceModel>> getDistanceList() async =>
      await _distanceService.getDistanceList();

  @override
  Stream<QuerySnapshot> getStreamDistanceList() async* {
    yield* _distanceService.getStreamDistanceList();
  }

  @override
  Future<dynamic> deleteDistanceById({id}) async {
    await _distanceService.deleteDistanceById(id: id);
  }

  @override
  Future<dynamic> updateDistanceById({id, kilometer}) async {
    await _distanceService.updateDistanceById(id: id, kilometer: kilometer);
  }
}
