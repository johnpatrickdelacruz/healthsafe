import 'package:flutter/material.dart';
import 'package:healthsafe/bloc/add_distance/add_distance_bloc.dart';
import 'package:healthsafe/bloc/signin/signin_bloc.dart';
import 'package:healthsafe/bloc/signin/signin_event.dart';

import 'package:healthsafe/views/dialogs/generic_dialog.dart';
import 'package:flutter_form_bloc/flutter_form_bloc.dart';
import 'package:healthsafe/views/widget/app_drawer.dart';

import '../../values/strings.dart' as strings;

class AddDistancePage extends StatelessWidget {
  const AddDistancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final addDistanceBloc = BlocProvider.of<AddDistanceBloc>(context);

        return Scaffold(
          drawer: const AppDrawer(),
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
            title: const Text('Add Distance'),
          ),
          body: FormBlocListener<AddDistanceBloc, String, String>(
            onSubmitting: (context, state) {
              GenericDialog.showLoadingDialog(context);
            },
            onSuccess: (context, state) {
              Navigator.pop(context);

              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text(state.successResponse!)));
            },
            onFailure: (context, state) {
              Navigator.pop(context);
              if (state.failureResponse != 'show_field_error') {
                GenericDialog.showDialog(context,
                    title: strings.errorTitle, message: strings.errorGeneric);
              }
            },
            child: SingleChildScrollView(
              physics: const ClampingScrollPhysics(),
              child: AutofillGroup(
                child: Column(
                  children: <Widget>[
                    TextFieldBlocBuilder(
                      textFieldBloc: addDistanceBloc.kilometerController,
                      decoration: const InputDecoration(
                        labelText: 'Enter kilometer',
                        prefixIcon: Icon(Icons.arrow_forward_outlined),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: addDistanceBloc.submit,
                      child: const Text('Add distance'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
