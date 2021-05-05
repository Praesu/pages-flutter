import 'package:colina_pages/mixins/ValidationMixin.dart';
import 'package:colina_pages/pages/Dashboard.dart';
import 'package:colina_pages/pages/Forgot.dart';
import 'package:colina_pages/pages/Registration.dart';
import 'package:flutter/material.dart';
import 'package:colina_pages/widgets/CustomTextField.dart';
import 'package:colina_pages/widgets/PasswordField.dart';
import 'package:colina_pages/widgets/PrimaryBtn.dart';
import 'package:colina_pages/widgets/SecondaryBtn.dart';

class Login extends StatefulWidget {
  static const String routeName = 'login';

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> with ValidationMixin {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool obscureText = true;
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold (
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    CustomField(
                      label: "Email Address", 
                      hint: "Enter valid email", 
                      icon: Icons.email, 
                      textController: emailController, 
                      inputType: TextInputType.emailAddress,
                      validation: validateEmail,
                    ),
                    SizedBox(height: 20.0),
                    PasswordField(
                      label: "Password", 
                      hint: "Enter password", 
                      textController: passwordController, 
                      obscureText: obscureText, 
                      onTap: setPwdVisibility,
                      validation: validatePassword,
                    ),
                    SizedBox(height: 20.0),
                    PrimaryBtn(
                      text: "Login", 
                      icon: Icons.login, 
                      onPress: () {
                        login();
                      }
                    ),
                    SizedBox(height: 20.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        SecondaryBtn(
                          text: "New User? Register", 
                          onPress: () {
                            navToRegistration(context);
                          }
                        ),
                        SecondaryBtn(
                          text: "Forgot Password?", 
                          onPress: () {
                            navToForgot(context);
                          }
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void login() {
    if(formKey.currentState.validate()) {
      Navigator.pushNamed(context, Dashboard.routeName);
    }
  }
  
  void setPwdVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }

  void navToRegistration(BuildContext context) {
    Navigator.pushNamed(context, Registration.routeName);
  }

  void navToForgot(BuildContext context) {
    Navigator.pushNamed(context, ForgotPassword.routeName);
  }
}