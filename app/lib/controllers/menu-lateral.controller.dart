import 'dart:convert';
import 'package:app/models/usuario.model.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MenuLateralController extends ChangeNotifier {
  Future<UsuarioModel> obterUsuarioLogado() async {
    final SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    if (sharedPreferences.containsKey("usuario")) {
      var usuarioLogadoJson = jsonDecode(sharedPreferences.get("usuario"));
      var usuarioLogado = UsuarioModel.fromJson(usuarioLogadoJson);
      return usuarioLogado;
    }

    return null;
  }
}
