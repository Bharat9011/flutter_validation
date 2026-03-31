class ConfirmPasswordValidationSupport {
  final String _password;
  final String _confirmPassword;
  String? _error;

  ConfirmPasswordValidationSupport({
    required String password,
    required String confirmPassword,
  }) : _password = password,
       _confirmPassword = confirmPassword;

  ConfirmPasswordValidationSupport isRequired() {
    if (_confirmPassword.trim().isEmpty) {
      _error ??= "Confirm password is required";
    }
    return this;
  }

  ConfirmPasswordValidationSupport matchesPassword() {
    if (_password != _confirmPassword) {
      _error ??= "Passwords do not match";
    }
    return this;
  }

  String? validate() {
    return _error;
  }
}
