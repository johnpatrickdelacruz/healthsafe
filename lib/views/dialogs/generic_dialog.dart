import 'package:flutter/material.dart';
import 'package:healthsafe/views/dialogs/app_dialog.dart';
import 'package:healthsafe/views/dialogs/app_loading.dart';

import '../../values/strings.dart' as strings;

class GenericDialog {
  static Future showDialog(
    BuildContext context, {
    VoidCallback? onPopModal,
    String? title,
    String? message,
  }) async {
    onPopModal ??= () {
      Navigator.pop(context);
    };

    return _showAlert(
      context,
      title: title,
      message: message,
      onPress: onPopModal,
    );
  }

  static Future showLoadingDialog(BuildContext context) {
    return _showLoading(
      context,
    );
  }

  static Future _showAlert(
    BuildContext context, {
    Key? key,
    title,
    message,
    required VoidCallback onPress,
  }) async {
    return AppDialog.show(
      context,
      key: key,
      title: title,
      body: message,
      actions: [
        Expanded(
          child: ElevatedButton(
            child: const Text(
              strings.alertOk,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            onPressed: onPress,
          ),
        ),
      ],
    );
  }

  static Future _showLoading(
    BuildContext context, {
    Key? key,
  }) =>
      AppLoading.showLoading(
        context,
        key: key,
      );
}
