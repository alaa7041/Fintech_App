// ignore_for_file: type_literal_in_constant_pattern

import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // private constructor as I don't want to allow creating an instance of this class itself.
  SharedPrefHelper._();

  /// Removes a value from SharedPreferences with given [key].
  static removeData(String key) async {
    debugPrint('SharedPrefHelper : data with key : $key has been removed');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values in the SharedPreferences
  static clearAllData() async {
    debugPrint('SharedPrefHelper : all data has been cleared');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in the SharedPreferences.
  static setData(String key, value) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    debugPrint("SharedPrefHelper : setData with key : $key and value : $value");
    switch (value.runtimeType) {
      case String:
        await sharedPreferences.setString(key, value);
        break;
      case int:
        await sharedPreferences.setInt(key, value);
        break;
      case bool:
        await sharedPreferences.setBool(key, value);
        break;
      case double:
        await sharedPreferences.setDouble(key, value);
        break;
      default:
        return null;
    }
  }

  /// Gets a bool value from SharedPreferences with given [key].
  static getBool(String key) async {
    debugPrint('SharedPrefHelper : getBool with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with given [key].
  static getDouble(String key) async {
    debugPrint('SharedPrefHelper : getDouble with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with given [key].
  static getInt(String key) async {
    debugPrint('SharedPrefHelper : getInt with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets an String value from SharedPreferences with given [key].
  static getString(String key) async {
    debugPrint('SharedPrefHelper : getString with key : $key');
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  /// Saves a [value] with a [key] in the FlutterSecureStorage.
  static setSecuredString(String key, String value) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
      "FlutterSecureStorage : setSecuredString with key : $key and value : $value",
    );
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets an String value from FlutterSecureStorage with given [key].
  static getSecuredString(String key) async {
    const flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage : getSecuredString with key :');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values in the FlutterSecureStorage
  static clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage : all data has been cleared');
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }

  static Future<void> setToken(String token) async {
    await SharedPrefHelper.setSecuredString(SharedPrefsKeys.userToken, token);
    log("Token saved: $token");
  }

  static Future<String> getToken() async {
    return await SharedPrefHelper.getSecuredString(SharedPrefsKeys.userToken);
  }

  static Future<void> clearToken() async {
    const flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.delete(key: SharedPrefsKeys.userToken);
  }

  static Future<bool> get isLoggedIn async {
    final String token = await SharedPrefHelper.getToken();
    log("Retrieved token: $token");
    return token.isNotEmpty;
  }

  static Future<bool> get hasSeenOnboarding async {
    final bool? hasSeenOnboarding =
        await SharedPrefHelper.getBool(SharedPrefsKeys.hasSeenOnboarding);
    return hasSeenOnboarding ?? true;
  }

  
  /// Save biometrics enabled flag
static Future<void> setBiometricsEnabled(bool enabled) async {
  await setData(SharedPrefsKeys.biometricsEnabled, enabled);
  debugPrint("Biometrics enabled set to: $enabled");
}

/// Get biometrics enabled flag
static Future<bool> getBiometricsEnabled() async {
  return await getBool(SharedPrefsKeys.biometricsEnabled);
}

/// Save email (optional)
static Future<void> setSavedEmail(String email) async {
  await setData(SharedPrefsKeys.savedEmail, email);
}

/// Get saved email
static Future<String> getSavedEmail() async {
  return await getString(SharedPrefsKeys.savedEmail);
}

}

class SharedPrefsKeys {
  static const String hasSeenOnboarding = "hasSeenOnboarding";
  static const String userToken = "userToken";
  static const String userRole = "userRole";
  static const String lang = "lang";
  // New keys for biometrics
  static const String biometricsEnabled = "biometricsEnabled";
  static const String savedEmail = "savedEmail"; 
}
