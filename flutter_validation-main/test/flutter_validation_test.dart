import 'package:flutter_test/flutter_test.dart';
import 'package:flutter_validation/src/validations.dart';

void main() {
  //EMAIL
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

  //PASSWORD

test('Valid password', () {
    var validation = Validatiors()
        .passwordValidator(value: "Bharat@123")
        .isRequired()
        .minLength(8)
        //.maxLength(15)
        .hasUppercase()
        .hasLowercase()
        .hasNumber()
        .hasSpecialCharacter()
        .noSpaces()
        .validate();

    expect(validation, null);
  });

test('Password is required', () {
  var validation = Validatiors()
      .passwordValidator(value: "")
      .isRequired()
      .validate();

  expect(validation, "Password is required");
});

test('Password minimum length', () {
  var validation = Validatiors()
      .passwordValidator(value: "Bh@1")
      .minLength(8)
      .validate();

  expect(validation, "Password must be at least 8 characters");
});

// test('Password maximum length', () {
//   var validation = Validatiors()
//       .passwordValidator(value: "BharatPassword@123456")
//       .maxLength(15)
//       .validate();

//   expect(validation, "Password must be less than 15 characters");
// });

  test('Password missing uppercase', () {
    var validation = Validatiors()
        .passwordValidator(value: "bharat@123")
        .hasUppercase()
        .validate();

    expect(validation, "Password must contain at least one uppercase letter");
  });

    test('Password missing number', () {
    var validation = Validatiors()
        .passwordValidator(value: "Bharat@")
        .hasNumber()
        .validate();

    expect(validation, "Password must contain at least one number");
  });


    test('Password missing lowercase', () {
    var validation = Validatiors()
        .passwordValidator(value: "BHARAT@123")
        .hasLowercase()
        .validate();

    expect(validation, "Password must contain at least one lowercase letter");
  });

  test('Password contains spaces', () {
    var validation = Validatiors()
        .passwordValidator(value: "Bharat @123")
        .noSpaces()
        .validate();

    expect(validation, "Password should not contain spaces");
  });

    test('Password missing special character', () {
    var validation = Validatiors()
        .passwordValidator(value: "bharat123")
        .hasSpecialCharacter()
        .validate();

    expect(validation, "Password must contain at least one special character");
  });

test('Confirm password is required', () {
  var validation = Validatiors()
      .confirmPasswordValidator(
        password: "Bharat@123",
        confirmPassword: "",
      )
      .isRequired()
      .validate();

  expect(validation, "Confirm password is required");
});
  test('Confirm password matched', () {
    var validation = Validatiors()
        .confirmPasswordValidator(
          password: "Bharat@123",
          confirmPassword: "Bharat@123",
        )
        .isRequired()
        .matchesPassword()
        .validate();

    expect(validation, null);
  });

  test('Confirm password not matched', () {
    var validation = Validatiors()
        .confirmPasswordValidator(
          password: "Bharat@123",
          confirmPassword: "Bharat@124",
        )
        .matchesPassword()
        .validate();

    expect(validation, "Passwords do not match");
  });


}
