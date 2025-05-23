import 'package:musiumapplication/core/constant/app_string.dart';

class ValidationHelper {
  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.emailRequired;
    }
    final emailRegex = RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$');
    if (!emailRegex.hasMatch(value)) {
      return AppString.validEmail;
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return AppString.passwordRequired;
    } else if (value.length < 6) {
      return AppString.sixCharacters;
    } else if (!RegExp(r'[A-Z]').hasMatch(value)) {
      return AppString.oneUppercaseLetter;
    } else if (!RegExp(r'[a-z]').hasMatch(value)) {
      return AppString.oneLowercaseLetter;
    } else if (!RegExp(r'[0-9]').hasMatch(value)) {
      return AppString.oneDigit;
    }
    return null;
  }

  // price conversation like $ to INR

// calculation hoi je multiple time use thati hoi ani mate
}
