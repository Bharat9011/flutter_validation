import 'package:flutter_validation/src/validation_support/email_validation_support.dart';

abstract class Validators {
  EmailValidationSupport? emailValidator({required String? value});

  String? contactValidator({required String? value});


}
