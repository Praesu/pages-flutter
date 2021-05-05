class ValidationMixin {
  String validateEmail(String email) {
    String error;
    if(email.isEmpty) {
      error = "Email cannot be empty.";
    } else if(!(RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email))) {
      error = "Invalid email.";
    } else {
      error = null;
    }

    return error;
  }

  String validatePassword(String pwd) {
    String error;
    if(pwd.isEmpty) {
      error = "Password cannot be empty.";
    } else if(pwd.length < 8) {
      error = "Password is too short.";
    } else if(!(RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(pwd))) {
      error = "Password is too weak.";
    } else {
      error = null;
    }

    return error;
  }
}