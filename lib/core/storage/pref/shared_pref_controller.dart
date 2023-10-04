import 'package:shared_preferences/shared_preferences.dart';
import 'package:tasty_choise_provider/core/storage/pref/pref_keys.dart';
import 'package:tasty_choise_provider/future/auth/models/user_model.dart';

class SharedPrefController {
  static final SharedPrefController _instance =
      SharedPrefController._internal();

  late SharedPreferences _preferences;

  SharedPrefController._internal();

  factory SharedPrefController() => _instance;

  Future<SharedPreferences> initSharedPref() async =>
      _preferences = await SharedPreferences.getInstance();

  SharedPreferences get prefManager => _preferences;

  Future<bool> setToken(String token) async =>
      await _preferences.setString(PrefKeys.TOKEN, token);

  String? get getToken => _preferences.getString(PrefKeys.TOKEN);

  Future<bool> saveDataUser(UserModel user) async {
    await _preferences.setInt(PrefKeys.ID_USER, user.id ?? -1);
    await _preferences.setString(PrefKeys.NAME_USER, user.name ?? "");
    await _preferences.setString(PrefKeys.PHONE_USER, user.phone ?? "");
    await _preferences.setString(PrefKeys.TOKEN, user.token ?? "");
    await _preferences.setString(PrefKeys.EMAIL, user.email ?? "");
    await _preferences.setString(PrefKeys.MANAGER_NAME, user.mangerName ?? "");
    return await _preferences.setString(PrefKeys.IMAGE_USER, user.image ?? "");
  }

  UserModel getDataUser() {
    int id = _preferences.getInt(PrefKeys.ID_USER) ?? -1;
    String name = _preferences.getString(PrefKeys.NAME_USER) ?? "";
    String phone = _preferences.getString(PrefKeys.PHONE_USER) ?? "";
    String token = _preferences.getString(PrefKeys.TOKEN) ?? "";
    String managerName = _preferences.getString(PrefKeys.MANAGER_NAME) ?? "";
    String image = _preferences.getString(PrefKeys.IMAGE_USER) ?? "";
    String email = _preferences.getString(PrefKeys.EMAIL) ?? "";

    return UserModel(
      id: id,
      name: name,
      phone: phone,
      token: token,
      mangerName: managerName,
      image: image,
      email: email,
    );
  }

  Future<bool> setLang(String token) async =>
      await _preferences.setString(PrefKeys.LANG, token);

  String get getLang => _preferences.getString(PrefKeys.LANG) ?? 'ar';

  Future clearAllData() async {
    await _preferences.clear();
  }
}
