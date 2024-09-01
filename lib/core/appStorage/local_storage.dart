import 'package:shared_preferences/shared_preferences.dart';

class Preferences {
  SharedPreferences? _preferences;
  static final Preferences instance = Preferences._instance();
  static const String cachePosts = 'cached_posts';

  Preferences._instance();

  Future<SharedPreferences?> initPref() async {
    _preferences ??= await SharedPreferences.getInstance();
    return _preferences;
  }

  Future<bool> cachedPosts(String posts) async {
    bool isSet = await _preferences!.setString(cachePosts, posts);
    return isSet;
  }

  Future<bool> logout() async {
    bool isSet = await _preferences!.clear();
    return isSet;
  }

  String get getCachedPosts => _preferences!.getString(cachePosts) ?? '';
}
