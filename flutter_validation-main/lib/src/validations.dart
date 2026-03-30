import 'package:flutter_validation/src/validation_support/confirmpass_validation_support.dart';
import 'package:flutter_validation/src/validation_support/email_validation_support.dart';
import 'package:flutter_validation/src/validation_support/pass_validation_support.dart';

import 'interface/validators.dart';

class Validatiors implements Validators {
  @override
  String? contactValidator({required String? value}) {
    return "";
  }

  @override
  EmailValidationSupport emailValidator({required String? value}) {
    return EmailValidationSupport(value!);
  }


  PasswordValidationSupport passwordValidator({required String? value}) {
    return PasswordValidationSupport(value ?? '');
  }

   ConfirmPasswordValidationSupport confirmPasswordValidator({
    required String? password,
    required String? confirmPassword,
  }) {
    return ConfirmPasswordValidationSupport(
      password: password ?? '',
      confirmPassword: confirmPassword ?? '',
    );
  }





}
