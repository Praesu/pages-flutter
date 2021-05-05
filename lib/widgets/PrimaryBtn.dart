import 'package:flutter/material.dart';

class PrimaryBtn extends StatelessWidget {
  final String text;
  final IconData icon;
  final Function onPress;

  PrimaryBtn({
    @required this.text,
    @required this.icon,
    @required this.onPress
  });
  @override
  Widget build(BuildContext context) {
    return ButtonTheme(
      minWidth: double.maxFinite,
      height: 100,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          padding: EdgeInsets.symmetric(horizontal: 40.0, vertical: 20.0),
          primary: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(30.0)
          ),
        ),
        onPressed: onPress,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(icon),
            SizedBox(width: 10.0),
            Text(text, style: TextStyle(
              fontSize: 18.0,
            )),
          ],
        ),
      ),
    );
  }
}