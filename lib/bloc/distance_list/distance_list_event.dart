import 'package:equatable/equatable.dart';

abstract class DistanceListEvent extends Equatable {
  const DistanceListEvent();

  @override
  List<Object> get props => [];
}

class GetDistanceListEvent extends DistanceListEvent {
  const GetDistanceListEvent();

  @override
  String toString() => 'GetDistanceListEvent';
}

class DeleteDistanceById extends DistanceListEvent {
  const DeleteDistanceById({required this.id});

  final String id;

  @override
  List<Object> get props => [id];

  @override
  String toString() => 'id $id';
}

class UpdateDistanceById extends DistanceListEvent {
  const UpdateDistanceById({required this.id, required this.kilometer});

  final String id;
  final String kilometer;

  @override
  List<Object> get props => [id, kilometer];

  @override
  String toString() => 'id $id, kilometer $kilometer';
}
