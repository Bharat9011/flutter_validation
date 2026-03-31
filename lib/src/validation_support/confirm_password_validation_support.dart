class ConfirmPasswordValidationSupport {
  final String _password;
  final String _confirmPassword;
  String? _error;

  ConfirmPasswordValidationSupport({
    required String password,
    required String confirmPassword,
  }) : _password = password,
       _confirmPassword = confirmPassword;

  ConfirmPasswordValidationSupport isRequired({String? message}) {
    if (_confirmPassword.trim().isEmpty) {
      _error ??=message ?? "Confirm password is required";
    }
    return this;
  }

  ConfirmPasswordValidationSupport matchesPassword({String? message}) {
    if (_password != _confirmPassword) {
      _error ??= message ?? "Passwords do not match";
    }
    return this;
  }

  ConfirmPasswordValidationSupport custom(
    bool Function(String password, String confirmPassword) validator,{
    String message = "Confirm password is invalid",
  }) {
    if (_error != null) return this;

    if (!validator(_password, _confirmPassword)) {
      _error = message;
    }
    return this;
  }

  String? validate() {
    return _error;
  }
}
