import 'dart:convert';

import 'package:app/models/erro.model.dart';
import 'package:app/models/login.model.dart';
import 'package:app/models/usuario.model.dart';
import 'package:app/repositories/databases/usuario.database.dart';
import 'package:flutter/widgets.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginController extends ChangeNotifier {
  final UsuarioDatabase usuarioDatabase = new UsuarioDatabase();
  List<ErroModel> erros;
  UsuarioModel usuario = new UsuarioModel();
  List<UsuarioModel> usuarios;

  void limparSession() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    if (sharedPreferences.containsKey("usuario")) {
      sharedPreferences.remove("usuario");
    }
  }

  Future<UsuarioModel> entrar(LoginModel request) async {
    try {
      this.usuario = await usuarioDatabase.login(request);
      SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      await sharedPreferences.setString("usuario", jsonEncode(this.usuario));
      return this.usuario;
    } catch (ex) {
      this.usuario = null;
      return this.usuario;
    }
  }

  Future<List<UsuarioModel>> listar() async {
    try {
      this.usuarios = await usuarioDatabase.listar();
      return this.usuarios;
    } catch (ex) {
      this.usuario = null;
      return this.usuarios;
    }
  }
}
