import 'package:form_validations/src/validation_support/confirm_password_validation_support.dart';
import 'package:form_validations/src/validation_support/contact_validation_support.dart';
import 'package:form_validations/src/validation_support/email_validation_support.dart';
import 'package:form_validations/src/validation_support/name_validation_support.dart';
import 'package:form_validations/src/validation_support/number_validation_support.dart';
import 'package:form_validations/src/validation_support/password_validation_support.dart';

import 'interface/validator.dart';

class Validators implements Validator {
  @override
  ContactValidationSupport? contactValidator({required String? value}) {
    return ContactValidationSupport(value!);
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

  @override
  NumberValidationSupport numberValidator({required String? value}) {
    return NumberValidationSupport(value ?? '');
  }

  @override
  String? multiValidator({required List<String?> validations}) {
    for (var val in validations) {
      if (val != null) return val;
    }
    return null;
  }
}
