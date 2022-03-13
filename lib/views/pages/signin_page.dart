import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:healthsafe/bloc/navigation/navigation_bloc.dart';
import 'package:healthsafe/bloc/navigation/navigation_event.dart';
import 'package:healthsafe/bloc/signin/signin_bloc.dart';
import 'package:healthsafe/bloc/signin/signin_event.dart';
import 'package:healthsafe/bloc/signin/signin_state.dart';
import 'package:healthsafe/views/dialogs/generic_dialog.dart';

import '../../values/strings.dart' as strings;

class SignInPage extends StatefulWidget {
  const SignInPage({Key? key}) : super(key: key);

  @override
  _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: dead_code
    return BlocListener<SignInBloc, SignInState>(
      listener: (context, state) {
        if (state is SignInSuccess) {
          Navigator.pop(context);
          BlocProvider.of<NavigationBloc>(context)
              .add(const NavigationToEnterDistance(predicate: false));
        }
        if (state is SignInFailure) {
          GenericDialog.showDialog(context,
              title: strings.errorTitle, message: strings.errorGeneric);
        }

        if (state is SignInLoading) {
          GenericDialog.showLoadingDialog(context);
        }
      },
      child: BlocBuilder<SignInBloc, SignInState>(
        builder: (context, state) {
          return Scaffold(
            backgroundColor: Colors.white,
            appBar: AppBar(
              title: const Text("SignIn"),
            ),
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                ElevatedButton(
                  child: const Text(
                    strings.signIn,
                    style: TextStyle(
                      color: Colors.white,
                    ),
                  ),
                  onPressed: () {
                    BlocProvider.of<SignInBloc>(context)
                        .add(const SignInUserEvent());
                  },
                ),
                Container(height: 20.0), //SizedBox(height: 20.0),
              ],
            ),
          );
        },
      ),
    );
  }
}
