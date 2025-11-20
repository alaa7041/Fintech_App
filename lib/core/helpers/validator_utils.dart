import 'package:easy_localization/easy_localization.dart';

class ValidatorUtils {
  static const String _requiredFieldKey = 'This field is required';
  static String? requiredField(String? value) {
    if (value == null || value.trim().isEmpty) {
      return _requiredFieldKey.tr();
    }

    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Email is required'.tr();
    } else if (!RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
    ).hasMatch(value)) {
      return 'Invalid email address'.tr();
    }
    return null;
  }

  static String? validateName(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Name is required'.tr();
    } else if (!RegExp(
      r"^[\p{L} ,.'-]*$",
      caseSensitive: false,
      unicode: true,
      dotAll: true,
    ).hasMatch(value)) {
      return 'Invalid name'.tr();
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required'.tr();
    } else if (!RegExp(r'^(?=.*?[0-9]).{8,}$').hasMatch(value)) {
      return 'Invalid password'.tr();
    }
    return null;
  }

  static String? validatePasswordConfirm(String? value, String? password) {
    if (value == null || value.trim().isEmpty) {
      return 'Password is required'.tr();
    } else if (value != password) {
      return 'Password does not match'.tr();
    }
    return null;
  }

  static String? validateHighSecurityPassword(String? value) {
    RegExp regex = RegExp(
      r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$',
    );
    if (value == null || value.trim().isEmpty) {
      return 'Password is required'.tr();
    } else {
      if (!regex.hasMatch(value)) {
        return 'Invalid password'.tr();
      } else {
        return null;
      }
    }
  }

  static String? validateEGPhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required'.tr();
    } else if (!RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(value)) {
      return 'Invalid phone number'.tr();
    }
    return null;
  }

  static String? validateUAEPhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required'.tr();
    } else if (!RegExp(r'^(?:05\d{8}|\+9715\d{8})$').hasMatch(value)) {
      return 'Invalid phone number'.tr();
    }
    return null;
  }

  static String? validateSAPhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required'.tr();
    } else if (!RegExp(r'^(05|5)\d{7,8}$').hasMatch(value)) {
      return 'Invalid phone number'.tr();
    }
    return null;
  }

  static String? validateKWPhoneNumber(String? value) {
    if (value == null || value.trim().isEmpty) {
      return 'Phone number is required'.tr();
    } else if (!RegExp(r'^(5|6|9)\d{7}$').hasMatch(value)) {
      return 'Invalid phone number'.tr();
    }
    return null;
  }

  static bool hasLowerCase(String password) {
    return RegExp(r'^(?=.*[a-z])').hasMatch(password);
  }

  static bool hasUpperCase(String password) {
    return RegExp(r'^(?=.*[A-Z])').hasMatch(password);
  }

  static bool hasNumber(String password) {
    return RegExp(r'^(?=.*?[0-9])').hasMatch(password);
  }

  static bool hasSpecialCharacter(String password) {
    return RegExp(r'^(?=.*?[#?!@$%^&*-])').hasMatch(password);
  }

  static bool hasMinLength(String password) {
    return RegExp(r'^(?=.{8,})').hasMatch(password);
  }
}
