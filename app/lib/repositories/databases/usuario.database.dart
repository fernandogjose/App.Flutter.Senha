import 'package:sqflite/sqflite.dart';
import 'package:app/models/login.model.dart';
import 'package:app/models/usuario.model.dart';

import 'base.database.dart';

class UsuarioDatabase {
  Future<int> adicionar(UsuarioModel request) async {
    final Database database = await new BaseDatabase().obterBancoDeDados();
    return await database.insert('usuarios', request.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<UsuarioModel> login(LoginModel request) async {
    if (request.email == 'fernandogjose@gmail.com' && request.senha == 'g716iso2') {
      return new UsuarioModel(nome: 'Fernando José', email: 'fernandogjose@gmail.com');
    }

    return throw new Exception("Usuário ou senha inválido");
    // final Database database = await new BaseDatabase().ObterBancoDeDados();
    // final List<Map<String, dynamic>> maps = await database.query('usuarios');
    // for (var map in maps) {
    //   if (map['email'] == request.email && map['senha'] == request.senha) {
    //     return UsuarioModel.fromJson(map);
    //   }
    // }

    // return null;
  }

  Future<List<UsuarioModel>> listar() async {
    final Database database = await new BaseDatabase().obterBancoDeDados();
    final List<Map<String, dynamic>> maps = await database.query('usuarios');
    List<UsuarioModel> response;
    for (var map in maps) {
      final UsuarioModel usuarioModel = UsuarioModel.fromJson(map);
      if (usuarioModel.nome != '' && usuarioModel.email != '') {
        response.add(usuarioModel);
      }
    }

    return response;
  }
}
