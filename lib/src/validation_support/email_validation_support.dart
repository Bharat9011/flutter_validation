class EmailValidationSupport {
  final String _value;
  String? _error;

  EmailValidationSupport(this._value);

  EmailValidationSupport isRequired() {
    if (_value.trim().isEmpty) {
      _error ??= "Email is required";
    }
    return this;
  }

  EmailValidationSupport isValidEmail() {
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(_value)) {
      _error ??= "Invalid email";
    }
    return this;
  }

  EmailValidationSupport noSpaces() {
    if (_value.contains(" ")) {
      _error ??= "Email should not contain spaces";
    }
    return this;
  }

  EmailValidationSupport hasAtSymbol() {
    if (!_value.contains("@")) {
      _error ??= "Email must contain @";
    }
    return this;
  }

  EmailValidationSupport allowDomain(List<String> domains) {
    bool isValid = domains.any((domain) => _value.endsWith(domain));

    if (!isValid) {
      String allowed = domains.join(', ');
      _error ??= "Email must be from one of these domains: $allowed";
    }

    return this;
  }

  EmailValidationSupport minLength(int length) {
    if (_value.length < length) {
      _error ??= "Email must be at least $length characters";
    }
    return this;
  }

  EmailValidationSupport maxLength(int length) {
    if (_value.length > length) {
      _error ??= "Email must be less than $length characters";
    }
    return this;
  }

  EmailValidationSupport singleAtSymbol() {
    if ("@".allMatches(_value).length > 1) {
      _error ??= "Email cannot contain multiple @";
    }
    return this;
  }

  EmailValidationSupport noStartingDot() {
    if (_value.startsWith(".")) {
      _error ??= "Email cannot start with dot";
    }
    return this;
  }

  EmailValidationSupport noEndingDot() {
    if (_value.endsWith(".")) {
      _error ??= "Email cannot end with dot";
    }
    return this;
  }

  EmailValidationSupport noConsecutiveDots() {
    if (_value.contains("..")) {
      _error ??= "Email cannot contain consecutive dots";
    }
    return this;
  }

  String? validate() {
    return _error;
  }
}
