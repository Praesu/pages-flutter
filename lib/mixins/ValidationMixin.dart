class ValidationMixin {
  String validateEmail(String email) {
    String error;
    if(email.isEmpty) {
      error = "Email cannot be empty";
    } else if(!(RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email))) {
      error = "Invalid email";
    } else {
      error = null;
    }

    return error;
  }

  String validatePassword(String pwd) {
    String error;
    if(pwd.isEmpty) {
      error = "Password cannot be empty";
    } else if(pwd.length < 8) {
      error = "Password is too short";
    } else if(!(RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(pwd))) {
      error = "Password is too weak";
    } else {
      error = null;
    }

    return error;
  }

  String validateName(String name) {
    String error;
    if(name.isEmpty) {
      error = "Required";
    } else if(name.length < 3) {
      error = "Name is too short";
    } else if(name.length > 10) {
      error = "Name is too long";
    } else {
      error = null;
    }

    return error;
  }

  String validateAddress(String address) {
    String error;
    if(address.isEmpty) {
      error = "Address cannot be empty";
    } else if(address.length < 10) {
      error = "Invalid address";
    } else {
      error = null;
    }

    return error;
  }

  String validateText(String text) {
    String error;
    if(text.isEmpty) {
      error = "Required";
    } else {
      error = null;
    }

    return error;
  }

  String validateNumber(String number) {
    String error;
    if(number.isEmpty) {
      error = "Required";
    } else {
      error = null;
    }

    return error;
  }

  String validateConfirm(String pwd, String conf) {
    String error;
    if(conf.isEmpty) {
      error = "Password cannot be empty";
    } else if(conf.length < 8) {
      error = "Password is too short";
    } else if(!(RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$").hasMatch(pwd))) {
      error = "Password is too weak";
    } else if(pwd != conf) {
      error = "Password does not match";
    } else {
      error = null;
    }

    return error;
  }
}