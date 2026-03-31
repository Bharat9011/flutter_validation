class EmailValidationSupport {
  final String _value;
  String? _error;

  EmailValidationSupport(this._value);

  EmailValidationSupport isRequired({String? message}) {
    if (_value.trim().isEmpty) {
      _error ??= message ??= "Email is required";
    }
    return this;
  }

  EmailValidationSupport isValidEmail({String? message}) {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(_value)) {
      _error ??= message ??= "Invalid email";
    }
    return this;
  }

  EmailValidationSupport noSpaces({String? message}) {
    if (_value.contains(" ")) {
      _error ??= message ??= "Email should not contain spaces";
    }
    return this;
  }

  EmailValidationSupport hasAtSymbol({String? message}) {
    if (!_value.contains("@")) {
      _error ??= message ??= "Email must contain @";
    }
    return this;
  }

  EmailValidationSupport allowDomain(List<String> domains, {String? message}) {
    bool isValid = domains.any((domain) => _value.endsWith(domain));

    if (!isValid) {
      String allowed = domains.join(', ');
      _error ??= message ??=
          "Email must be from one of these domains: $allowed";
    }

    return this;
  }

  EmailValidationSupport minLength(int length, {String? message}) {
    if (_value.length < length) {
      _error ??= message ??= "Email must be at least $length characters";
    }
    return this;
  }

  EmailValidationSupport maxLength(int length, {String? message}) {
    if (_value.length > length) {
      _error ??= message ??= "Email must be less than $length characters";
    }
    return this;
  }

  EmailValidationSupport singleAtSymbol({String? message}) {
    if ("@".allMatches(_value).length > 1) {
      _error ??= message ??= "Email cannot contain multiple @";
    }
    return this;
  }

  EmailValidationSupport noStartingDot({String? message}) {
    if (_value.startsWith(".")) {
      _error ??= message ??= "Email cannot start with dot";
    }
    return this;
  }

  EmailValidationSupport noEndingDot({String? message}) {
    if (_value.endsWith(".")) {
      _error ??= message ??= "Email cannot end with dot";
    }
    return this;
  }

  EmailValidationSupport noConsecutiveDots({String? message}) {
    if (_value.contains("..")) {
      _error ??= message ??= "Email cannot contain consecutive dots";
    }
    return this;
  }

  EmailValidationSupport custom(
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
