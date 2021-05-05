import 'package:colina_pages/pages/Dashboard.dart';
import 'package:colina_pages/pages/Forgot.dart';
import 'package:colina_pages/pages/Login.dart';
import 'package:colina_pages/pages/Registration.dart';
import 'package:flutter/cupertino.dart';

final Map<String, WidgetBuilder> routes = {
  Login.routeName: (BuildContext context) => Login(),
  Registration.routeName: (BuildContext context) => Registration(),
  ForgotPassword.routeName: (BuildContext context) => ForgotPassword(),
  Dashboard.routeName: (BuildContext context) => Dashboard(),
};