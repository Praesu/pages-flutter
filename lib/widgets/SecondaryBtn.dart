import 'package:flutter/material.dart';

class SecondaryBtn extends StatelessWidget {
  final String text;
  final Function onPress;

  SecondaryBtn({
    @required this.text,
    @required this.onPress
  });
  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: onPress,
      child: Text(text),
    );
  }
}