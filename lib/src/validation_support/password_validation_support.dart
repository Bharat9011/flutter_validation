class PasswordValidationSupport {
  final String _value;
  String? _error;

  PasswordValidationSupport(String value) : _value = value;



PasswordValidationSupport isRequired() {
    if (_value.trim().isEmpty) {
      _error ??= "Password is required";
    }
    return this;
  }

  PasswordValidationSupport minLength(int length) {
    if (_value.length < length) {
      _error ??= "Password must be at least $length characters";
    }
    return this;
  }

  PasswordValidationSupport maxLength(int length) {
    if (_value.length > length) {
      _error ??= "Password must be less than $length characters";
    }
    return this;
  }

  PasswordValidationSupport hasUppercase() {
    if (!RegExp(r'[A-Z]').hasMatch(_value)) {
      _error ??= "Password must contain at least one uppercase letter";
    }
    return this;
  }

  PasswordValidationSupport hasLowercase() {
    if (!RegExp(r'[a-z]').hasMatch(_value)) {
      _error ??= "Password must contain at least one lowercase letter";
    }
    return this;
  }

  PasswordValidationSupport hasNumber() {
    if (!RegExp(r'[0-9]').hasMatch(_value)) {
      _error ??= "Password must contain at least one number";
    }
    return this;
  }

  PasswordValidationSupport hasSpecialCharacter() {
    if (!RegExp(r'[!@#$%^&*(),.?":{}|<>_\-\\/\[\]=+;]').hasMatch(_value)) {
      _error ??= "Password must contain at least one special character";
    }
    return this;
  }

  PasswordValidationSupport noSpaces() {
    if (_value.contains(' ')) {
      _error ??= "Password should not contain spaces";
    }
    return this;
  }

custom(
  bool Function(String value) validator,
  String message,
) {
  if (_error != null) return this;

  if (!validator(_value)) {
    _error = message;
  }
  return this;
}

  String? validate() {
    return _error;
  }
}
