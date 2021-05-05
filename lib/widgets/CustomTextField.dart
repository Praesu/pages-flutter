import 'package:flutter/material.dart';

class CustomField extends StatelessWidget {
  final String label;
  final String hint;
  final IconData icon;
  final TextEditingController textController;
  final TextInputType inputType;
  final Function validation;
   
  CustomField(
    {@required this.label, 
     @required this.hint, 
     @required this.icon, 
     @required this.textController, 
     @required this.inputType,
     @required this.validation
    });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      keyboardType: inputType,
      validator: validation,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        prefixIcon: Container(
          padding: EdgeInsets.symmetric(horizontal: 15.0),
          child: Icon(icon),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ),
    );
  }
}