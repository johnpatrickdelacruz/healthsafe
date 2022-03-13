import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthsafe/bloc/navigation/navigation_bloc.dart';
import 'package:healthsafe/locator.dart';
import 'package:healthsafe/network/services/navigation_services.dart';
import 'package:healthsafe/views/router.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<NavigationBloc>(
      create: (_) => NavigationBloc(),
      child: MaterialApp(
        navigatorKey: serviceLocator<NavigationService>().navigatorKey,
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.splash,
        onGenerateRoute: RouterManager.generateRoute,
      ),
    );
  }
}
