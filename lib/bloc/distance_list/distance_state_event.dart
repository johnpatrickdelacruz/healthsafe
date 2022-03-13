import 'package:equatable/equatable.dart';
import 'package:healthsafe/model/distance_model.dart';
import 'package:healthsafe/network/errors.dart';

abstract class DistanceListState extends Equatable {
  const DistanceListState();

  @override
  List<Object> get props => [];
}

class DistanceListInitial extends DistanceListState {}

class DeleteDistanceSuccess extends DistanceListState {}

class UpdateDistanceSuccess extends DistanceListState {}

class DistanceListSuccess extends DistanceListState {
  const DistanceListSuccess({required this.distanceModelList});

  final List<DistanceModel> distanceModelList;

  @override
  List<Object> get props => [distanceModelList];

  @override
  String toString() =>
      'DistanceListFailure {DistanceListSuccess: $distanceModelList}';
}

class DistanceListLoading extends DistanceListState {}

class DistanceListFailure extends DistanceListState {
  const DistanceListFailure({required this.error});

  final Errors error;

  @override
  List<Object> get props => [error];

  @override
  String toString() => 'DistanceListFailure {error: $error}';
}
