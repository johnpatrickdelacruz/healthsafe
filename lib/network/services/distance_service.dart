import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:healthsafe/model/distance_model.dart';

class DistanceService {
  final CollectionReference _distance =
      FirebaseFirestore.instance.collection('distance');

  Future<String> addDistance({kilometer}) async {
    String resp = '';

    // var _randomId = _distance.doc().id;

    await _distance.add({
      // "id": _randomId,
      "kilometer": kilometer,
      "date": DateTime.now().toString()
    }).then((value) {
      resp = 'success';
    }).catchError((e) {
      resp = 'fail';
    });

    return resp;
  }

  Future<List<DistanceModel>> getDistanceList() async {
    QuerySnapshot querySnapshot = await _distance.get();

    return querySnapshot.docs
        .map((doc) => DistanceModel.fromSnapshot(
            doc.data() as Map<String, dynamic>, doc.id))
        .toList();
  }

  Future<dynamic> deleteDistanceById({id}) async {
    await _distance.doc(id).delete();
  }

  Future<dynamic> updateDistanceById({id, kilometer}) async {
    await _distance.doc(id).update({"kilometer": kilometer});
  }

  Stream<QuerySnapshot> getStreamDistanceList() async* {
    yield* _distance.snapshots();
  }
}
