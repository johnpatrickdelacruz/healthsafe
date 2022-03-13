import 'package:flutter/material.dart';

class BaseButton extends StatelessWidget {
  final String text;
  final Color btnTextColor;
  final Function() onPressed;

  const BaseButton(
      {Key? key,
      required this.text,
      required this.onPressed,
      this.btnTextColor = Colors.white})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      child: Text(
        text,
        style: TextStyle(
          color: btnTextColor,
        ),
      ),
      onPressed: () {
        onPressed();
      },
    );
  }
}
