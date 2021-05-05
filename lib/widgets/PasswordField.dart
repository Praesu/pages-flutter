import 'package:flutter/material.dart';

class PasswordField extends StatelessWidget {
  final String label;
  final String hint;
  final TextEditingController textController;
  final bool obscureText;
  final Function onTap;
  final Function validation;

  PasswordField({
    @required this.label,
    @required this.hint,
    @required this.textController,
    @required this.obscureText,
    @required this.onTap,
    @required this.validation
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      obscureText: obscureText,
      validator: validation,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Icon(Icons.lock),
        ),
        suffixIcon: GestureDetector(
          onTap: onTap,
          child: Icon(obscureText ? Icons.visibility_off : Icons.visibility),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ),
    );
  }
}