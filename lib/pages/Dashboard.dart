import 'package:flutter/material.dart';

class Dashboard extends StatefulWidget {
  static const String routeName = 'dashboard';

  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Dashboard"),
        ),
        body: SingleChildScrollView(
          
        ),
      ),
    );
  }
}