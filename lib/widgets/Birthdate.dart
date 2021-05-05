import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Birthdate extends StatefulWidget {
  @override
  _BirthdateState createState() => _BirthdateState();
}

class _BirthdateState extends State<Birthdate> {
  DateTime _dateTime;
  TextEditingController dateField = new TextEditingController();
  final DateFormat formatter = DateFormat('MM-dd-yyyy');

  void initState() {
    super.initState();
    _dateTime = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      readOnly: true,
      controller: dateField,
      decoration: InputDecoration(
        prefixIcon: GestureDetector(
          onTap: () {
            selectDate(context);
          },
          child: Icon(
            Icons.calendar_today_rounded,
            size: 18,
            color: Color.fromRGBO(105, 108, 121, 1),
          ),
        ),
        labelText: "Date of Birth",
        hintText: "mm-dd-yyyy",
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30.0)),
        ),
      ),
      validator: (String value) {
        if (value.isEmpty) return 'Required';
      },
    );
  }
  
  Future<Null> selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        helpText: "Birthdate",
        context: context,
        initialDate: DateTime(2000),
        firstDate: DateTime(1960),
        lastDate: DateTime(DateTime.now().year),
        builder: (BuildContext context, Widget child) {
          return Theme(
            data: ThemeData.light().copyWith(
              buttonTheme: ButtonThemeData(textTheme: ButtonTextTheme.primary),
            ),
            child: child,
          );
        });

    if (picked != null && picked != _dateTime) {
      setState(() {
        _dateTime = picked;
        dateField.text = formatter.format(_dateTime);
      });
    }
  }
}