import 'package:flutter_validation/src/validation_support/email_validation_support.dart';

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
}
