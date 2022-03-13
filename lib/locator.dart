import 'package:get_it/get_it.dart';
import 'package:healthsafe/bloc/add_distance/add_distance_bloc.dart';
import 'package:healthsafe/bloc/distance_list/distance_list_bloc.dart';
import 'package:healthsafe/bloc/signin/signin_bloc.dart';
import 'package:healthsafe/network/repositories/auth_repository.dart';
import 'package:healthsafe/network/repositories/distance_repository.dart';
import 'package:healthsafe/network/services/auth_service.dart';
import 'package:healthsafe/network/services/distance_service.dart';
import 'package:healthsafe/network/services/navigation_services.dart';

final GetIt serviceLocator = GetIt.I;

Future setupLocator() async {
  serviceLocator.registerLazySingleton<AuthService>(() => AuthService());
  serviceLocator
      .registerLazySingleton<NavigationService>(() => NavigationService());
  serviceLocator.registerLazySingleton<SignInBloc>(() => SignInBloc());
  serviceLocator.registerFactory<AuthRepository>(() => AuthRepository());
  serviceLocator.registerFactory<AddDistanceBloc>(() => AddDistanceBloc());
  serviceLocator
      .registerFactory<DistanceRepository>(() => DistanceRepository());
  serviceLocator.registerFactory<DistanceService>(() => DistanceService());
  serviceLocator.registerFactory<DistanceListBloc>(() => DistanceListBloc());
}
