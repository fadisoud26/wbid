String? pinCodeTextFieldValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Pin code can\'t be empty';
  }
  return null;
}

String? textValidator(value) {
  if (value == null || value.isEmpty) {
    return 'this field can\'t be empty';
  }
  return null;
}

String? passwordValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Password field can\'t be empty';
  }
  if (value.length < 8) {
    return 'Password\'length must longer than 8!';
  }
  return null;
}

String? phoneNumberValidator(value) {
  if (value == null || value.isEmpty) {
    return 'Phone number field can\'t be empty';
  }
  /*if (value < 10 && value > 10) {
    return 'PhoneNumber\'length must be 10 numbers';
  }
 */
  if (!value.toString().startsWith('09')) {
    return 'Enter a valid Phone Number';
  }
  return null;
}

String? emailValidator(value) {
  String pattern =
      r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
      r"{0,253}[a-zA-Z0-9])?)*$";

  RegExp regex = RegExp(pattern);
  if (value == null || value.isEmpty) {
    return 'Email field can\'t be empty';
  }
  if (!regex.hasMatch(value)) {
    return 'Enter a valid email address';
  }
  return null;
}

String? dateTimeValidator(value) {
  if (value.isEmpty) {
    return 'Please enter a date';
  }
  return null;
}
