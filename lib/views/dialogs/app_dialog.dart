import 'package:flutter/material.dart';

class AppDialog extends StatelessWidget {
  const AppDialog({
    Key? key,
    required this.title,
    required this.body,
    required this.actions,
    this.icon,
  }) : super(key: key);

  final String title;
  final String body;
  final List<Widget> actions;
  final String? icon;

  @override
  Widget build(BuildContext context) => WillPopScope(
        onWillPop: () async => false,
        child: Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          elevation: 10,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontWeight: FontWeight.w600, fontSize: 20),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: Text(
                    body,
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: actions,
                )
              ],
            ),
          ),
        ),
      );

  static Future show(
    BuildContext context, {
    Key? key,
    required String title,
    required String body,
    String? icon,
    List<Widget>? actions,
  }) {
    bool barrierDismissible;

    if (actions == null || actions.isEmpty) {
      barrierDismissible = false;
    } else {
      barrierDismissible = true;
    }

    final AppDialog dialog = AppDialog(
      key: key,
      title: title,
      body: body,
      actions: actions!,
      icon: icon,
    );

    return showDialog(
      context: context,
      barrierDismissible: barrierDismissible,
      builder: (context) => dialog,
    );
  }
}
