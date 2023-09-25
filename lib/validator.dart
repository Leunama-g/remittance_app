import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';

Function emailValidator = (String value) {
  debugPrint(value);
  if (value.trim().isEmpty) {
    return "Email Required";
  } else if (!EmailValidator.validate(value)) {
    return "Enter a correct email";
  }
  return null;
};

Function passwordValidator = (value) {
  if (value!.trim().isEmpty) {
    return "Password Required!";
  } else if (value.length < 8) {
    return "Password length can't be less than 8";
  }
  return null;
};
