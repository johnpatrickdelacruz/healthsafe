import 'package:flutter/material.dart';

class AppLoading extends StatelessWidget {
  const AppLoading({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Dialog(
        insetPadding: const EdgeInsets.all(50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 10,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              margin: const EdgeInsets.all(20),
              child: const CircularProgressIndicator(
                backgroundColor: Colors.grey,
                strokeWidth: 5,
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Future showLoading(
    BuildContext context, {
    Key? key,
  }) {
    final AppLoading dialog = AppLoading(
      key: key,
    );

    return showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => dialog,
    );
  }
}
