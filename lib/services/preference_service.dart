import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  final SharedPreferences instance;

  PreferenceService(this.instance);

  String? get accessToken {
    return instance.getString(PreferenceKeys.accessToken);
  }

  Future<bool> setAccessToken(String accessToken) async {
    return await instance.setString(PreferenceKeys.accessToken, accessToken);
  }
}

class PreferenceKeys {
  static String get accessToken => 'access-token-key';
}
