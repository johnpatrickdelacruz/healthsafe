import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthsafe/bloc/add_distance/add_distance_bloc.dart';
import 'package:healthsafe/bloc/distance_list/distance_list_bloc.dart';
import 'package:healthsafe/bloc/signin/signin_bloc.dart';
import 'package:healthsafe/locator.dart';
import 'package:healthsafe/views/pages/add_distance_page.dart';
import 'package:healthsafe/views/pages/distance_list_page.dart';
import 'package:healthsafe/views/pages/signin_page.dart';
import 'package:healthsafe/views/pages/splash_page.dart';

class RouterManager {
  static Route generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splash:
        return MaterialPageRoute(
          builder: (_) => const SplashPage(),
        );

      case Routes.signin:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => serviceLocator<SignInBloc>(),
            child: const SignInPage(),
          ),
        );

      case Routes.enterDistance:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => serviceLocator<AddDistanceBloc>(),
            child: const AddDistancePage(),
          ),
        );

      case Routes.viewDistanceList:
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => serviceLocator<DistanceListBloc>(),
            // create: (context) => serviceLocator<DistanceListBloc>()
            //   ..add(const GetDistanceListEvent()),
            child: const DistanceListPage(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}

class Routes {
  static const String splash = "splash";
  static const String signin = "signin";
  static const String enterDistance = "enter_distance";
  static const String viewDistanceList = "view_distance_list";
}
