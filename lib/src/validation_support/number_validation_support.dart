class NumberValidationSupport {
  final String _value;
  String? _error;

  NumberValidationSupport(String value) : _value = value;

  NumberValidationSupport isRequired({String? message}) {
    if (_value.trim().isEmpty) {
      _error ??= message ?? "Number is required";
    }
    return this;
  }

  NumberValidationSupport digitsOnly({String? message}) {
    if (!RegExp(r'^\d+$').hasMatch(_value)) {
      _error ??= message ?? "Only digits are allowed";
    }
    return this;
  }

  NumberValidationSupport minLength(int length, {String? message}) {
    if (_value.length < length) {
      _error ??= message ?? "Must be at least $length digits";
    }
    return this;
  }

  NumberValidationSupport maxLength(int length, {String? message}) {
    if (_value.length > length) {
      _error ??= message ?? "Must be less than $length digits";
    }
    return this;
  }

  NumberValidationSupport exactLength(int length, {String? message}) {
    if (_value.length != length) {
      _error ??= message ?? "Must be exactly $length digits";
    }
    return this;
  }

  NumberValidationSupport minValue(num min, {String? message}) {
    final number = num.tryParse(_value);
    if (number == null || number < min) {
      _error ??= message ?? "Value must be at least $min";
    }
    return this;
  }

  NumberValidationSupport maxValue(num max, {String? message}) {
    final number = num.tryParse(_value);
    if (number == null || number > max) {
      _error ??= message ?? "Value must be less than or equal to $max";
    }
    return this;
  }

  NumberValidationSupport inRange(num min, num max, {String? message}) {
    final number = num.tryParse(_value);
    if (number == null || number < min || number > max) {
      _error ??= message ?? "Value must be between $min and $max";
    }
    return this;
  }

  NumberValidationSupport isInteger({String? message}) {
    if (!RegExp(r'^-?\d+$').hasMatch(_value)) {
      _error ??= message ?? "Value must be an integer";
    }
    return this;
  }

  NumberValidationSupport isPositive({String? message}) {
    final number = num.tryParse(_value);
    if (number == null || number <= 0) {
      _error ??= message ?? "Value must be greater than 0";
    }
    return this;
  }

  NumberValidationSupport noSpaces({String? message}) {
    if (_value.contains(' ')) {
      _error ??= message ?? "Spaces are not allowed";
    }
    return this;
  }

  NumberValidationSupport custom(
    bool Function(String value) validator, {
    String message = "Number is invalid",
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
