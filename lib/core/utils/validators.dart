class Validators {
  static _isValidEmail(String input) => RegExp(
        r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)"
        r"*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+"
        r"[a-z0-9](?:[a-z0-9-]*[a-z0-9])?",
      ).hasMatch(input);

  static String? validateEmail(
    String value,
    String? emailRequiredMessage,
    String? validEmailMessage,
  ) {
    if (value.isEmpty) return emailRequiredMessage;

    if (!_isValidEmail(value)) return validEmailMessage;

    return null;
  }

  static bool isValidEmail(String value) {
    if (value.isEmpty) return false;

    return _isValidEmail(value);
  }

  static bool isValidName(String value) {
    if (value.isEmpty) return false;

    return RegExp(r'^[a-zA-Z ]+$').hasMatch(value);
  }

  static String? validateCourseSelection(String value) {
    if (value.isEmpty || value == 'Select a course') {
      return 'Please select a course';
    }
    return null;
  }

  static String? validateImageSelection(dynamic image) {
    if (image == null) {
      return 'Please upload a payment receipt';
    }
    return null;
  }
}
