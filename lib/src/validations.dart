import 'package:flutter_validation/src/validation_support/email_validation_support.dart';

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
}
