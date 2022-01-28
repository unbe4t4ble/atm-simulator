import 'package:atm_simulator/feature/atm/data/models/atm_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final _atm = "atm";
final _userLogin = "name";

class SharedPref {
  Future<void> setAtmModelList(List<AtmModel> data) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_atm, atmModelDataToJsonArray(data));
  }

  Future<List<AtmModel>> getAtmModelDataList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String stringifiedJson = prefs.getString(_atm) ?? "[]";
    return atmModelDataFromJsonArray(stringifiedJson);
  }

  Future<void> setUserLogin(String name) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(_userLogin, name);
  }

  Future<String> getUserLogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String result = prefs.getString(_userLogin) ?? "";
    return result;
  }
}
