import 'package:app/controllers/home.controller.dart';
import 'package:app/controllers/senha.controller.dart';
import 'package:app/themes/claro.theme.dart';
import 'package:app/views/pages/login.page.dart';
import 'package:app/views/widgets/menu-lateral.widget.dart';
import 'package:app/views/widgets/senha-lista.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return homePage(context);
  }

  Widget homePage(BuildContext context) {
    usuarioLogado(context);

    return Scaffold(
      appBar: new AppBar(
        backgroundColor: ClaroTheme.corPrimaria,
        title: new Text("Minhas Senhas"),
      ),
      drawer: new Drawer(child: MenuLateral()),
      body: SenhaLista(),
    );
  }

  void navegarParaLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => LoginPage()),
    );
  }

  HomeController obterHomeController(BuildContext context) {
    HomeController controller = Provider.of<HomeController>(context, listen: false);
    return controller;
  }

  void usuarioLogado(BuildContext context) async {
    HomeController controller = obterHomeController(context);
    bool estaLogado = await controller.usuarioLogado();
    if (!estaLogado) {
      navegarParaLogin(context);
    }
  }
}
