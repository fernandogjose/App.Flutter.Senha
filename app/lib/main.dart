import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'controllers/login.controller.dart';
import 'controllers/home.controller.dart';
import 'controllers/menu-lateral.controller.dart';
import 'controllers/senha.controller.dart';
import 'views/pages/login.page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<LoginController>.value(value: LoginController()),
        ChangeNotifierProvider<HomeController>.value(value: HomeController()),
        ChangeNotifierProvider<MenuLateralController>.value(value: MenuLateralController()),
        ChangeNotifierProvider<SenhaController>.value(value: SenhaController()),
      ],
      child: Main(),
    );
  }
}

class Main extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Eco Aprender',
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}
