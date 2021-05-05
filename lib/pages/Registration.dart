import 'package:flutter/material.dart';

class Registration extends StatefulWidget {
  static const String routeName = 'registration';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register new user"),
        ),
        body: Text("Registration Page"),
      ),
    );
  }
}