import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthsafe/bloc/navigation/navigation_bloc.dart';
import 'package:healthsafe/bloc/navigation/navigation_event.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 3), () async {
      BlocProvider.of<NavigationBloc>(context)
          .add(const NavigationToSignIn(predicate: false));
    }).catchError((error) => throw Exception(error));
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Icon(
          Icons.adb,
          color: Colors.green,
          size: 150,
        ),
      ),
    );
  }
}
