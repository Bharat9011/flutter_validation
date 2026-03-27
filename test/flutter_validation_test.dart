import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation/src/validations.dart';

void main() {
  test('Email Formate Check', () {
    var validation = Validatiors()
        .emailValidator(value: "bharat.sc01@gmail.com")
        .isRequired()
        .isValidEmail()
        .validate();
    expect(validation, null);
  });

  test('Check Space in email', () {
    var validation = Validatiors()
        .emailValidator(value: "bharat .sc01@gmail.com")
        .isRequired()
        .isValidEmail()
        .noSpaces()
        .validate();
    expect(validation, "Email should not contain spaces");
  });

  test('Check @ in email', () {
    var validation = Validatiors()
        .emailValidator(value: "bharat.sc01.com")
        .hasAtSymbol()
        .validate();
    expect(validation, "Email must contain @");
  });

  test('Check domain in email', () {
    List<String> domains = [".com", ".outlook", ".in"];
    var validation = Validatiors()
        .emailValidator(value: "bharat.sc01.com")
        .allowDomain(domains)
        .validate();
    expect(validation, null);
  });
}
