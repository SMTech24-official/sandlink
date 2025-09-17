import 'package:hive_flutter/hive_flutter.dart';

class StorageService {
  static final StorageService _instance = StorageService._internal();
  factory StorageService() => _instance;
  StorageService._internal();

  final _box = Hive.box('storage');

  Future<void> saveData(String key, dynamic value) async {
    await _box.put(key, value);
  }

  dynamic getData(String key) {
    return _box.get(key);
  }

  Future<void> removeData(String key) async {
    await _box.delete(key);
  }

  Future<void> clearAll() async {
    await _box.clear();
  }
}
