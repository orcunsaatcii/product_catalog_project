import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<void> saveCache(String key, String data) async {
    final prefs = await SharedPreferences.getInstance();
    final timestamp = DateTime.now().millisecondsSinceEpoch;

    await prefs.setString(key, data);
    await prefs.setInt('${key}_timestamp', timestamp);
  }

  static Future<String?> getCache(String key) async {
    final prefs = await SharedPreferences.getInstance();
    final timestamp = prefs.getInt('${key}_timestamp');
    if (timestamp == null) return null;

    final now = DateTime.now().millisecondsSinceEpoch;
    // Eğer veri 24 saatten eskiyse null döndür
    if (now - timestamp > 24 * 60 * 60 * 1000) {
      await prefs.remove(key);
      await prefs.remove('${key}_timestamp');
      return null;
    }

    return prefs.getString(key);
  }
}
