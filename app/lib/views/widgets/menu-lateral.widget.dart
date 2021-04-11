import 'package:app/controllers/menu-lateral.controller.dart';
import 'package:app/models/usuario.model.dart';
import 'package:app/themes/claro.theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MenuLateral extends StatefulWidget {
  @override
  _MenuLateralState createState() => _MenuLateralState();
}

class _MenuLateralState extends State<MenuLateral> {
  UsuarioModel usuarioLogado = new UsuarioModel(nome: '', email: '');

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ClaroTheme.corPrimariaClaro2,
      child: ListView(
        children: <Widget>[
          new UserAccountsDrawerHeader(
            decoration: BoxDecoration(
              color: ClaroTheme.corPrimaria,
            ),
            accountName: new Text(
              usuarioLogado.nome,
              style: TextStyle(fontSize: 18),
            ),
            accountEmail: new Text(
              usuarioLogado.email,
              style: TextStyle(fontSize: 14),
            ),
            currentAccountPicture: new CircleAvatar(
              backgroundColor: ClaroTheme.corPrimaria,
              backgroundImage: AssetImage('assets/images/foto-perfil.png'),
            ),
          ),
          new ListTile(
            title: new Text(
              'Minhas Senhas',
              style: TextStyle(
                color: ClaroTheme.corPrimariaEscuro,
                fontSize: 18,
              ),
            ),
            onTap: () {
              // Navigator.of(context).pop();
              // Navigator.push(
              //     context,
              //     new MaterialPageRoute(
              //         builder: (BuildContext context) => new ComunicadoPage()));
            },
          ),
          new Divider(
            color: ClaroTheme.corPrimariaEscuro,
            height: 2.0,
          ),
          new ListTile(
            title: new Text(
              'Sair',
              style: TextStyle(
                color: ClaroTheme.corPrimariaEscuro,
                fontSize: 18,
              ),
            ),
            onTap: () {
              Navigator.of(context).pushNamedAndRemoveUntil('/', (Route<dynamic> route) => false);
            },
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    obterUsuarioLogado();
    super.initState();
  }

  void obterUsuarioLogado() async {
    MenuLateralController controller = Provider.of<MenuLateralController>(context, listen: false);
    UsuarioModel usuario = await controller.obterUsuarioLogado();

    if (usuario == null) {
      return;
    }

    setState(() {
      usuarioLogado = usuario;
    });
  }
}
