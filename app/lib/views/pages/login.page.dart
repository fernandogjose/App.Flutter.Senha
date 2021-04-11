import 'package:app/controllers/login.controller.dart';
import 'package:app/models/login.model.dart';
import 'package:app/models/usuario.model.dart';
import 'package:app/themes/claro.theme.dart';
import 'package:app/views/pages/home.page.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  LoginModel request = new LoginModel(email: '', senha: '');
  bool _carregando = false;

  @override
  void initState() {
    limparSession();
    super.initState();
  }

  @override
  Widget build(BuildContext contex) {
    return Scaffold(
      key: _scaffoldKey,
      body: Container(
        // linha do box
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              // box verde degrade
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 2.5,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      ClaroTheme.corPrimariaEscuro,
                      ClaroTheme.corPrimaria,
                    ],
                  ),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(100),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.lock,
                      size: 100,
                      color: ClaroTheme.branco,
                    ),
                    Align(
                      alignment: Alignment.bottomRight,
                      child: Padding(
                        padding: EdgeInsets.only(
                          right: 30,
                          top: 40,
                        ),
                        child: Text(
                          "Secret Senhas",
                          style: TextStyle(color: ClaroTheme.branco, fontSize: 20, fontWeight: FontWeight.w400),
                        ),
                      ),
                    )
                  ],
                ),
              ),

              // formulário
              Container(
                padding: EdgeInsets.only(top: 50),
                child: Column(
                  children: <Widget>[
                    // e-mail
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      padding: EdgeInsets.only(
                        top: 4,
                        left: 16,
                        right: 16,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: ClaroTheme.branco,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextField(
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          icon: Icon(Icons.email, color: Colors.grey),
                          hintText: 'e-mail',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          request.email = value;
                        },
                      ),
                    ),

                    // senha
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      margin: EdgeInsets.only(top: 30),
                      padding: EdgeInsets.only(
                        top: 4,
                        left: 16,
                        right: 16,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(
                          Radius.circular(50),
                        ),
                        color: ClaroTheme.branco,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black26,
                            blurRadius: 5,
                          ),
                        ],
                      ),
                      child: TextField(
                        keyboardType: TextInputType.text,
                        obscureText: true,
                        decoration: InputDecoration(
                          icon: Icon(Icons.security, color: Colors.grey),
                          hintText: 'senha',
                          border: InputBorder.none,
                        ),
                        onChanged: (value) {
                          request.senha = value;
                        },
                      ),
                    ),

                    // botão de entrar
                    Container(
                      margin: EdgeInsets.only(top: 80),
                      width: MediaQuery.of(context).size.width / 1.2,
                      height: 50,
                      decoration: BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [
                              ClaroTheme.corPrimariaEscuro,
                              ClaroTheme.corPrimaria,
                            ],
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(50))),
                      child: InkWell(
                        child: Center(
                          child: Text(
                            _carregando ? 'Entrando...' : 'Entrar',
                            style: TextStyle(
                              color: ClaroTheme.branco,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        onTap: () {
                          if (!_carregando) {
                            entrar(context);
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void limparSession() async {
    LoginController controller = obterLoginController(context);
    controller.entrar(request);
  }

  void preencherCarregando(bool value) {
    setState(() {
      _carregando = value;
    });
  }

  void navegarParaHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => HomePage()),
    );
  }

  LoginController obterLoginController(BuildContext context) {
    LoginController controller = Provider.of<LoginController>(context, listen: false);
    return controller;
  }

  void entrar(BuildContext context) async {
    // Desabilita o botão
    preencherCarregando(true);

    // Validaçoes do form
    final snackbar = SnackBar(content: Text('E-mail ou Senha inválidos'));
    if (request.email.trim() == '' || request.senha.trim() == '') {
      ScaffoldMessenger.of(context).showSnackBar(snackbar);

      // Habilita o botão
      preencherCarregando(false);
      return;
    }

    // chama o login
    LoginController controller = obterLoginController(context);
    UsuarioModel response = await controller.entrar(this.request);

    // login com sucesso, navegar até a homepage
    if (response != null) {
      navegarParaHome(context);

      // Habilita o botão
      preencherCarregando(false);

      return;
    }

    // login com erro, exibir a mensagem de erro
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

    // Habilita o botão
    preencherCarregando(false);
  }
}
