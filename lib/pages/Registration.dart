import 'package:colina_pages/pages/Dashboard.dart';
import 'package:colina_pages/widgets/Birthdate.dart';
import 'package:colina_pages/widgets/CustomTextField.dart';
import 'package:colina_pages/widgets/PasswordField.dart';
import 'package:colina_pages/widgets/PrimaryBtn.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:colina_pages/mixins/ValidationMixin.dart';


class Registration extends StatefulWidget {
  static const String routeName = 'registration';

  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> with ValidationMixin {
  GlobalKey<FormState> formKey = GlobalKey<FormState>(); 
  final TextEditingController establishmentController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController pwdController = TextEditingController();
  final TextEditingController pwdConfController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController dateController = TextEditingController();
  bool obscureText = true;
  bool obscureTextConf = true;
  String _userType;
  List _userTypes = [
    "Civilian",
    "Contact Tracer",
  ];
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("Register new user"),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Center(
            child: SingleChildScrollView(
              child: Form(
                key: formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0),
                    DropdownButtonFormField(
                      value: _userType,
                      decoration: InputDecoration(
                        hintText: "User Type",
                      ),
                      icon: Icon(Icons.arrow_drop_down),
                      items: _userTypes
                            .map((item) {
                             return DropdownMenuItem(
                              value: item,
                              child: Text(item),
                             );
                            }).toList(),
                      validator:(val) => 
                                val == null
                                ? "required"
                                : null,
                      onChanged: (val) {
                        setState(() {
                          _userType = val;
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    (_userType == "Contact Tracer") 
                    ? CustomField(
                      label: "Establishment", 
                      hint: "Enter valid establishment", 
                      icon: Icons.store, 
                      textController: establishmentController, 
                      inputType: TextInputType.text, 
                      validation: validateText,
                    )
                    : CustomField(
                      label: "First Name", 
                      hint: "Enter first name", 
                      icon: Icons.person, 
                      textController: fnameController, 
                      inputType: TextInputType.text, 
                      validation: validateName,
                    ),
                    SizedBox(height: 20.0),
                    (_userType == "Contact Tracer") 
                    ? SizedBox(height: 0)
                    : CustomField(
                      label: "Last Name", 
                      hint: "Enter last name", 
                      icon: Icons.person, 
                      textController: lnameController, 
                      inputType: TextInputType.text, 
                      validation: validateName,
                    ),
                    SizedBox(height: (_userType == "Contact Tracer")? 0 : 20.0),
                    (_userType == "Contact Tracer") 
                    ? SizedBox(height: 0)
                    : Birthdate(),
                    SizedBox(height: (_userType == "Contact Tracer")? 0 : 20.0),
                    CustomField(
                      label: "Phone number", 
                      hint: "Enter valid phone number", 
                      icon: Icons.phone,
                      textController: phoneController, 
                      inputType: TextInputType.phone, 
                      validation: validateNumber,
                    ),
                    SizedBox(height: 20.0),
                    CustomField(
                      label: "Email Address", 
                      hint: "Enter valid email address", 
                      icon: Icons.email, 
                      textController: emailController, 
                      inputType: TextInputType.emailAddress, 
                      validation: validateEmail,
                    ),
                    SizedBox(height: 20.0),

                    (_userType == "Contact Tracer") 
                    ? CustomField(
                      label: "Store Address", 
                      hint: "Enter valid address", 
                      icon: Icons.house_sharp, 
                      textController: addressController, 
                      inputType: TextInputType.streetAddress, 
                      validation: validateText,
                    )
                    : CustomField(
                      label: "Home Address", 
                      hint: "Enter valid address", 
                      icon: Icons.house_sharp, 
                      textController: addressController, 
                      inputType: TextInputType.streetAddress, 
                      validation: validateText,
                    ),
                    SizedBox(height: 20.0),
                    PasswordField(
                      label: "Password", 
                      hint: "Enter password", 
                      textController: pwdController, 
                      obscureText: obscureText, 
                      onTap: setPwdVisibility, 
                      validation: validatePassword,
                    ),
                    SizedBox(height: 20.0),
                    PasswordField(
                      label: "Confirm password", 
                      hint: "Re-enter password", 
                      textController: pwdConfController, 
                      obscureText: obscureTextConf, 
                      onTap: setPwdConfVisibility, 
                      validation: (val) {
                        String error;
                        if(val.isEmpty) {
                          error = "Password cannot be empty";
                        } else if(val.length < 8) {
                          error = "Password is too short";
                        } else if(!(RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(val))) {
                          error = "Password is too weak";
                        } else if(pwdController.text != val) {
                          error = "Password does not match";
                        } else {
                          error = null;
                        }

                        return error;
                      }
                    ),
                    SizedBox(height: 20.0),
                    PrimaryBtn(
                      text: "Register", 
                      icon: Icons.app_registration,
                      onPress: () {
                        register();
                      }
                    ),
                    SizedBox(height: 20.0),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void register() {
    if(formKey.currentState.validate()) {
      Navigator.pushNamed(context, Dashboard.routeName);
    }
  }

  void setPwdVisibility() {
    setState(() {
      obscureText = !obscureText;
    });
  }
  void setPwdConfVisibility() {
    setState(() {
      obscureTextConf = !obscureTextConf;
    });
  }

}