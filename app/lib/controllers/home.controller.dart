import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeController extends ChangeNotifier {
  Future<bool> usuarioLogado() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool response = sharedPreferences.containsKey("usuario");
    print(sharedPreferences.get("usuario"));
    return response;
  }
}
