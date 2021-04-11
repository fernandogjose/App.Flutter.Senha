import 'package:app/controllers/senha.controller.dart';
import 'package:app/models/senha.model.dart';
import 'package:app/models/usuario.model.dart';
import 'package:app/themes/claro.theme.dart';
import 'package:app/views/widgets/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SenhaLista extends StatefulWidget {
  @override
  _SenhaListaState createState() => _SenhaListaState();
}

class _SenhaListaState extends State<SenhaLista> {
  List<SenhaModel> senhas;
  List<UsuarioModel> usuarios;

  @override
  Widget build(BuildContext context) {
    listarSenhas(context);
    return Loader(
      callback: lista,
      object: senhas,
    );
  }

  Widget lista() {
    return ListView.separated(
      itemCount: senhas.length,
      separatorBuilder: (BuildContext context, int index) => Divider(
        color: ClaroTheme.corPrimariaClaro,
      ),
      itemBuilder: (BuildContext context, int index) {
        final SenhaModel senha = senhas[index];

        return ListTile(
          title: Text(senha.site),
          subtitle: Text(senha.login),
        );
      },
    );
  }

  SenhaController obterSenhaController(BuildContext context) {
    SenhaController controller = Provider.of<SenhaController>(context, listen: false);
    return controller;
  }

  void listarSenhas(BuildContext context) async {
    SenhaController controller = obterSenhaController(context);
    var listarResponse = await controller.listar();
    setState(() {
      this.senhas = listarResponse;
    });
  }
}
