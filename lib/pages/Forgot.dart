import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  static const String routeName = 'forgot';

  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Forgot Password"),
        ),
        body: Text("Forgot Password page"),
      ),
    );
  }
}