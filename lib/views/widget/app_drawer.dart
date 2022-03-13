import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthsafe/bloc/navigation/navigation_bloc.dart';
import 'package:healthsafe/bloc/navigation/navigation_event.dart';
import 'package:healthsafe/bloc/signin/signin_bloc.dart';
import 'package:healthsafe/bloc/signin/signin_event.dart';
import 'package:healthsafe/bloc/signin/signin_state.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  _AppDrawerState createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        child: Column(
          children: <Widget>[
            ListTile(
              leading: const Icon(
                Icons.list,
                size: 20,
              ),
              title: const Text('View all distances'),
              onTap: () {
                Navigator.pop(context);
                BlocProvider.of<NavigationBloc>(context)
                    .add(const NavigationToViewDistanceList(predicate: true));
              },
            ),
          ],
        ),
      ),
    );
  }
}
