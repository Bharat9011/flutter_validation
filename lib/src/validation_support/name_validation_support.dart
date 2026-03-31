class NameValidationSupport {
  final String _value;
  String? _error;

  NameValidationSupport(String value) : _value = value;

  NameValidationSupport isRequired({String? message}) {
    if (_value.trim().isEmpty) {
      _error ??= message ?? "Name is required";
    }
    return this;
  }

  NameValidationSupport minLength(int length, {String? message}) {
    if (_value.trim().length < length) {
      _error ??= message ?? "Name must be at least $length characters";
    }
    return this;
  }

  NameValidationSupport maxLength(int length, {String? message}) {
    if (_value.trim().length > length) {
      _error ??= message ?? "Name must be less than $length characters";
    }
    return this;
  }

  NameValidationSupport noNumbers({String? message}) {
    if (RegExp(r'[0-9]').hasMatch(_value)) {
      _error ??= message ?? "Name should not contain numbers";
    }
    return this;
  }

  NameValidationSupport noSpecialCharacters({String? message}) {
    if (!RegExp(r"^[a-zA-Z\s]+$").hasMatch(_value)) {
      _error ??= message ?? "Name should not contain special characters";
    }
    return this;
  }

  NameValidationSupport noExtraSpaces({String? message}) {
    if (_value.contains(RegExp(r'\s{2,}'))) {
      _error ??= message ?? "Name should not contain multiple spaces";
    }
    return this;
  }

  NameValidationSupport startsWithLetter({String? message}) {
    if (!RegExp(r'^[a-zA-Z]').hasMatch(_value.trim())) {
      _error ??= message ?? "Name must start with a letter";
    }
    return this;
  }

  NameValidationSupport isFullName({String? message}) {
    final parts = _value.trim().split(RegExp(r'\s+'));
    if (parts.length < 2) {
      _error ??= message ?? "Please enter full name";
    }
    return this;
  }

  NameValidationSupport custom(
    bool Function(String value) validator, {
    String message = "Name is invalid",
  }) {
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