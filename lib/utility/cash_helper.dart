import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path_provider/path_provider.dart';

class CacheHelper {
  static late Box box;

  static Future<void> init() async {
    // Required for desktop apps
    final dir = await getApplicationSupportDirectory();
    Hive.init(dir.path);
    await Hive.initFlutter();

    box = await Hive.openBox('cacheBox');
  }

  static Future<void> setData({
    required String key,
    required dynamic value,
  }) async {
    await box.put(key, value);
  }

  static dynamic getData({required String key}) {
    return box.get(key);
  }

  static Future<void> removeData({required String key}) async {
    await box.delete(key);
  }
}
