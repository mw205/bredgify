import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class Storage {
  //singleton class
  static final Storage _instance = Storage._();
  FlutterSecureStorage storage = const FlutterSecureStorage();

  Storage._();

  /// Initializes the [FlutterSecureStorage] instance with encryption enabled.
  ///
  /// This method is called once when the app is initialized.
  ///
  /// See also:
  ///
  /// * [FlutterSecureStorage]
  /// * [AndroidOptions]
  void initStorage() {
    AndroidOptions getAndroidOptions() => const AndroidOptions(
          encryptedSharedPreferences: true,
        );
    storage = FlutterSecureStorage(aOptions: getAndroidOptions());
  }

  static Storage get instance => _instance;
}
