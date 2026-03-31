import 'package:flutter_validation/src/validation_support/confirm_password_validation_support.dart';
import 'package:flutter_validation/src/validation_support/email_validation_support.dart';
import 'package:flutter_validation/src/validation_support/name_validation_support.dart';
import 'package:flutter_validation/src/validation_support/password_validation_support.dart';

abstract class Validator {
  EmailValidationSupport? emailValidator({required String? value});

  String? contactValidator({required String? value});

  PasswordValidationSupport passwordValidator({required String? value});

  ConfirmPasswordValidationSupport confirmPasswordValidator({
    required String? password,
    required String? confirmPassword,
  });

  NameValidationSupport nameValidator({required String? value});

  
}
