import 'package:shared_preferences/shared_preferences.dart';

enum PrefKeys { loggedIn, email }

class SharedPrefController {
  static final SharedPrefController _instance =
      SharedPrefController._(); // انشائنا اوبجيكت من الكلاس

  late SharedPreferences _sharedPreferences;

  factory SharedPrefController() {
    // قابل على ارجاع وليس انشاء ... انستنس ممكن يكون منشئ مبسيقا
    // يمنع ارجاع من داخل الكلاس المحتوي على فاكتوري كونستركتور ومسمى .. انستنت الا بشرط تكون static
    return _instance;
  }

  SharedPrefController._(); //عشان نلغي الديفولت كونستركتور

  Future<void> initPref() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> save({required String email}) async {
    await _sharedPreferences.setBool(PrefKeys.loggedIn.toString(), true);
    await _sharedPreferences.setString(PrefKeys.email.toString(), email);
  }

  bool get loggedIn =>
      _sharedPreferences.getBool(PrefKeys.loggedIn.toString()) ?? false;

  String get email =>
      _sharedPreferences.getString(PrefKeys.email.toString()) ?? '';

  Future<bool> removeEmail() async {
    return await _sharedPreferences.remove(PrefKeys.email.toString());
  }

  Future<bool> remove({required String key}) async {
    if (_sharedPreferences.containsKey(key)) {
      return await _sharedPreferences.remove(key);
    }
    return false;
  }

  Future<bool> clear() async {
    return await _sharedPreferences.clear();
  }
}
