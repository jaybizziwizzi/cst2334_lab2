import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';

class Repository {
  static String _fName = '';
  static String _lName = '';
  static String _phoneNumber = '';
  static String _email = '';
  static String loginName = '';
  static String password = '';

  // Getters
  static String get fName => _fName;
  static String get lName => _lName;
  static String get phoneNumber => _phoneNumber;
  static String get email => _email;

  // Setters
  static set fName(String value) => _fName = value;
  static set lName(String value) => _lName = value;
  static set phoneNumber(String value) => _phoneNumber = value;
  static set email(String value) => _email = value;

  // Load data from Encrypted Shared Preferences
  static Future<void> loadData() async {
    final prefs = EncryptedSharedPreferences();
    loginName = await prefs.getString('Login') ?? '';
    password = await prefs.getString('Password') ?? '';
    _fName = await prefs.getString('FirstName') ?? '';
    _lName = await prefs.getString('LastName') ?? '';
    _phoneNumber = await prefs.getString('PhoneNumber') ?? '';
    _email = await prefs.getString('Email') ?? '';
  }

  // Save data to Encrypted Shared Preferences
  static Future<void> saveData() async {
    final prefs = EncryptedSharedPreferences();
    await prefs.setString('Login', loginName);
    await prefs.setString('Password', password);
    await prefs.setString('FirstName', _fName);
    await prefs.setString('LastName', _lName);
    await prefs.setString('PhoneNumber', _phoneNumber);
    await prefs.setString('Email', _email);
  }
}
