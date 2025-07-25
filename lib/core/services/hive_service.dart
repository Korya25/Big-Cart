import 'package:hive/hive.dart';

class HiveService {
  Future<Box> openBox(String name) async {
    return await Hive.openBox(name);
  }

  Future<void> write(String boxName, String key, dynamic value) async {
    final box = await openBox(boxName);
    await box.put(key, value);
  }

  Future<T?> read<T>(String boxName, String key) async {
    final box = await openBox(boxName);
    return box.get(key) as T?;
  }

  Future<bool> containsKey(String boxName, String key) async {
    final box = await openBox(boxName);
    return box.containsKey(key);
  }
}
