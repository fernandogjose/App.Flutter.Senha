import 'package:app/controllers/senha.controller.dart';
import 'package:app/models/senha.model.dart';
import 'package:app/models/usuario.model.dart';
import 'package:app/themes/claro.theme.dart';
import 'package:app/views/widgets/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SenhaListaWidget extends StatefulWidget {
  @override
  _SenhaListaWidgetState createState() => _SenhaListaWidgetState();
}

class _SenhaListaWidgetState extends State<SenhaListaWidget> {
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
    return Container(
      child: ListView.separated(
        itemCount: senhas.length,
        separatorBuilder: (BuildContext context, int index) => Divider(
          color: ClaroTheme.corPrimariaClaro,
        ),
        itemBuilder: (BuildContext context, int index) {
          final SenhaModel senha = senhas[index];

          return ListTile(
            title: Text(senha.site),
            subtitle: Text(senha.login + ' --- ' + senha.senha),
            trailing: new IconButton(
              icon: new Icon(Icons.remove_circle, color: Colors.red[900]),
              onPressed: () {
                remover(senha.site, senha.login, senha.senha);
              },
            ),
          );
        },
      ),
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

  void remover(String site, String login, String senha) async {
    final SenhaModel senhaModelRequest = new SenhaModel(site: site, login: login, senha: senha);
    SenhaController controller = obterSenhaController(context);
    await controller.remover(senhaModelRequest);
    listarSenhas(context);
  }
}
