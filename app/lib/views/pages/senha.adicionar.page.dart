import 'package:app/controllers/senha.controller.dart';
import 'package:app/models/senha.model.dart';
import 'package:app/themes/claro.theme.dart';
import 'package:app/views/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class SenhaAdicionarPage extends StatefulWidget {
  @override
  _SenhaAdicionarPageFormState createState() => _SenhaAdicionarPageFormState();
}

class _SenhaAdicionarPageFormState extends State<SenhaAdicionarPage> {
  final _formKey = GlobalKey<FormState>();
  String site = '';
  String login = '';
  String senha = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ClaroTheme.corPrimaria,
        title: new Text("Adicionar Senha"),
      ),
      body: Form(
        key: _formKey,
        child: Scrollbar(
          child: Align(
            alignment: Alignment.topCenter,
            child: Card(
              child: SingleChildScrollView(
                padding: EdgeInsets.all(16),
                child: ConstrainedBox(
                  constraints: BoxConstraints(maxWidth: 400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      ...[
                        // Site
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            labelText: 'Site',
                            labelStyle: TextStyle(color: ClaroTheme.corPrimaria),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ClaroTheme.corPrimaria)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              site = value;
                            });
                          },
                        ),
                        // Login
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            labelText: 'Login',
                            labelStyle: TextStyle(color: ClaroTheme.corPrimaria),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ClaroTheme.corPrimaria)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              login = value;
                            });
                          },
                        ),
                        // Senha
                        TextFormField(
                          decoration: InputDecoration(
                            filled: true,
                            labelText: 'Senha',
                            labelStyle: TextStyle(color: ClaroTheme.corPrimaria),
                            focusedBorder: UnderlineInputBorder(borderSide: BorderSide(width: 1, color: ClaroTheme.corPrimaria)),
                          ),
                          onChanged: (value) {
                            setState(() {
                              senha = value;
                            });
                          },
                        ),
                        // Botão Adicionar
                        SizedBox(
                          width: double.infinity,
                          height: 50,
                          child: TextButton(
                            child: Text('Adicionar'),
                            style: TextButton.styleFrom(
                              backgroundColor: ClaroTheme.corPrimaria,
                              primary: ClaroTheme.branco,
                              textStyle: TextStyle(color: ClaroTheme.branco, fontSize: 20),
                            ),
                            onPressed: () {
                              adicionar(context);
                            },
                          ),
                        )
                      ].expand(
                        (widget) => [
                          widget,
                          SizedBox(
                            height: 24,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  SenhaController obterSenhaController(BuildContext context) {
    SenhaController controller = Provider.of<SenhaController>(context, listen: false);
    return controller;
  }

  bool validarForm() {
    final snackbar = SnackBar(content: Text('Site / Login / Senha inválidos'));

    if (site.trim() == '' || login.trim() == '' || senha.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
      return false;
    }

    return true;
  }

  void adicionar(context) async {
    if (!validarForm()) {
      return;
    }

    final SenhaController controller = obterSenhaController(context);
    final SenhaModel senhaModelRequest = new SenhaModel(site: site.trim(), login: login.trim(), senha: senha.trim());
    controller.adicionar(senhaModelRequest);
    navegarParaHome();
  }

  void navegarParaHome() {
    Navigator.pop(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }
}
