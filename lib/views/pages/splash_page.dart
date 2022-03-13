import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
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
      var user = FirebaseAuth.instance.currentUser;

      if (user == null) {
        BlocProvider.of<NavigationBloc>(context)
            .add(const NavigationToSignIn(predicate: false));
      } else {
        BlocProvider.of<NavigationBloc>(context)
            .add(const NavigationToEnterDistance(predicate: false));
      }
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
