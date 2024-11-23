import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class SecureStorageService {
  static FlutterSecureStorage storage = const FlutterSecureStorage();

  static Future<void> writeSecureData(String key, String value) async {
    return await storage.write(key: key, value: value);
  }

  static Future<String> readSecureData(String key) async {
    return await storage.read(key: key) ?? '';
  }

  static Future<void> deleteSecureData(String key) async {
    return await storage.delete(key: key);
  }
}
