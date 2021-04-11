import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import '../../settings.dart';

class BaseDatabase {
  Future<Database> obterBancoDeDados() {
    // Retorna o último retorno do then, neste caso o database
    return getDatabasesPath().then((dbPath) {
      // Cria o path para o Sqflite
      final String path = join(dbPath, Settings.bancoDeDados);

      // Cria o banco de dados
      return openDatabase(path, onCreate: (db, version) {
        db.execute('CREATE TABLE usuarios(email TEXT, nome TEXT, senha TEXT)');
        db.execute('CREATE TABLE Senhas(site TEXT, login TEXT, senha TEXT)');
      }, version: 1);
    });
  }
}
