import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthsafe/bloc/add_distance/add_distance_bloc.dart';
import 'package:healthsafe/bloc/bloc_observer.dart';
import 'package:healthsafe/bloc/distance_list/distance_list_bloc.dart';
import 'package:healthsafe/bloc/navigation/navigation_bloc.dart';
import 'package:healthsafe/bloc/signin/signin_bloc.dart';
import 'package:healthsafe/locator.dart';
import 'package:device_preview/device_preview.dart' as dev_prev;
import 'package:healthsafe/views/app.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  await setupLocator();

  // Bloc.observer = SimpleBlocObserver();

  final List<BlocProvider> providers = [
    BlocProvider<SignInBloc>(create: (_) => serviceLocator<SignInBloc>()),
    BlocProvider<NavigationBloc>(
        create: (_) => serviceLocator<NavigationBloc>()),
    BlocProvider<DistanceListBloc>(
        create: (_) => serviceLocator<DistanceListBloc>()),
    BlocProvider<AddDistanceBloc>(
        create: (_) => serviceLocator<AddDistanceBloc>()),
  ];

  runZonedGuarded<Future>(
    () async =>
        SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
            .then(
      (_) {
        BlocOverrides.runZoned(
          () {
            runApp(
              dev_prev.DevicePreview(
                enabled: false,
                builder: (context) => MultiBlocProvider(
                  providers: providers,
                  child: const App(),
                ),
              ),
            );
          },
          blocObserver: SimpleBlocObserver(),
        );
      },
    ),
    (error, stackTrace) => print(error),
  );
}
