import 'package:app/models/senha.model.dart';
import 'package:app/repositories/databases/senha.database.dart';
import 'package:flutter/widgets.dart';

class SenhaController extends ChangeNotifier {
  final SenhaDatabase senhaDatabase = new SenhaDatabase();

  Future<List<SenhaModel>> listar() async {
    try {
      final List<SenhaModel> response = await senhaDatabase.listar();
      return response;
    } catch (e) {
      return null;
    }
  }
}
