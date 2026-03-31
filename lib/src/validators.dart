import 'package:flutter_validation/src/validation_support/confirm_password_validation_support.dart';
import 'package:flutter_validation/src/validation_support/email_validation_support.dart';
import 'package:flutter_validation/src/validation_support/name_validation_support.dart';
import 'package:flutter_validation/src/validation_support/password_validation_support.dart';

import 'interface/validator.dart';

class Validators implements Validator {
  @override
  String? contactValidator({required String? value}) {
    return "";
  }

  @override
  EmailValidationSupport emailValidator({required String? value}) {
    return EmailValidationSupport(value!);
  }

  @override
  PasswordValidationSupport passwordValidator({required String? value}) {
    return PasswordValidationSupport(value ?? '');
  }

  @override
  ConfirmPasswordValidationSupport confirmPasswordValidator({
    required String? password,
    required String? confirmPassword,
  }) {
    return ConfirmPasswordValidationSupport(
      password: password ?? '',
      confirmPassword: confirmPassword ?? '',
    );
  }

  @override
  NameValidationSupport nameValidator({required String? value}) {
    return NameValidationSupport(value ?? '');
  }

 
}
