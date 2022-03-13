import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthsafe/bloc/distance_list/distance_list_event.dart';
import 'package:healthsafe/bloc/distance_list/distance_state_event.dart';
import 'package:healthsafe/locator.dart';
import 'package:healthsafe/network/abstract_repositories/auth_repository_providing.dart';
import 'package:healthsafe/network/abstract_repositories/distance_repository_providing.dart';
import 'package:healthsafe/network/errors.dart';
import 'package:healthsafe/network/helper/connectivity_helper.dart';
import 'package:healthsafe/network/repositories/auth_repository.dart';
import 'package:healthsafe/network/repositories/distance_repository.dart';

class DistanceListBloc extends Bloc<DistanceListEvent, DistanceListState> {
  DistanceListBloc() : super(initialState) {
    on<DeleteDistanceById>((event, emit) async {
      emit(DistanceListLoading());
      if (!(await ConnectionHelper.hasConnection())) {
        emit(const DistanceListFailure(error: Errors.NoNetwork));
        return;
      }

      try {
        await _distanceRepositoryProviding.deleteDistanceById(id: event.id);
        emit(DeleteDistanceSuccess());
      } catch (error) {
        emit(const DistanceListFailure(error: Errors.Generic));
      }
    });
  }

  static DistanceListState get initialState => DistanceListInitial();

  Stream<QuerySnapshot> get kilometerListStream async* {
    var distanceModelList =
        _distanceRepositoryProviding.getStreamDistanceList();

    yield* distanceModelList;
  }

  final DistanceRepositoryProviding _distanceRepositoryProviding =
      serviceLocator<DistanceRepository>();

  final AuthRepositoryProviding _authRepository =
      serviceLocator<AuthRepository>();
}
