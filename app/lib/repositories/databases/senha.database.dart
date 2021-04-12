import 'package:app/models/senha.model.dart';
import 'package:app/repositories/databases/base.database.dart';
import 'package:sqflite/sqflite.dart';

class SenhaDatabase {
  Future<int> adicionar(SenhaModel request) async {
    final Database database = await new BaseDatabase().obterBancoDeDados();
    return await database.insert('senhas', request.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<int> remover(SenhaModel request) async {
    final Database database = await new BaseDatabase().obterBancoDeDados();
    final String site = request.site;
    final String login = request.login;
    final String senha = request.senha;
    return await database.rawDelete("DELETE FROM senhas WHERE site = '$site' AND login = '$login' AND senha = '$senha'");
  }

  Future<List<SenhaModel>> listar() async {
    final Database database = await new BaseDatabase().obterBancoDeDados();
    final List<Map<String, dynamic>> maps = await database.query('senhas');
    final List<SenhaModel> response = [];
    for (var map in maps) {
      final SenhaModel senhaModel = SenhaModel.fromJson(map);
      response.add(senhaModel);
    }

    return response;
  }
}
