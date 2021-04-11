import 'package:flutter/material.dart';

class ClaroTheme {
  static const Color branco = Color(0XFFFFFFFF);
  static const Color preto = Color(0xff040405);

  static const Color corPrimariaEscuro = Color.fromRGBO(33, 54, 36, 1);
  static const Color corPrimaria = Color.fromRGBO(63, 104, 68, 1);
  static const Color corPrimariaClaro = Color.fromRGBO(63, 104, 68, 0.5);
  static const Color corPrimariaClaro2 = Color.fromRGBO(63, 104, 68, 0.1);

  static const double tituloFontSize = 20;
  static const FontWeight tituloFontWeight = FontWeight.bold;
  static const Color tituloFontColor = corPrimariaEscuro;

  static const double tituloPequenoFontSize = 15;
  static const FontWeight tituloPequenoFontWeight = FontWeight.normal;
  static const Color tituloPequenoFontColor = corPrimariaClaro;

  static const double padraoFontSize = 18;
  static const FontWeight padraoFontWeight = FontWeight.normal;
  static const Color padraoFontColor = corPrimaria;

  static const double homeLinkFontSize = 20;
  static const FontWeight homeLinkFontWeight = FontWeight.normal;
  static const Color homeLinkFontColor = branco;

  static const double formularioLabelFontSize = 20;
  static const FontWeight formularioLabelFontWeight = FontWeight.w400;
  static const Color formularioLabelFontColor = corPrimaria;

  static const double formularioInputFontSize = 20;
  static const FontWeight formularioInputFontWeight = FontWeight.normal;
  static const Color formularioInputFontColor = corPrimaria;

  static const Color homeLinkComunicadoCorDeFundo = corPrimaria;
  static const Color homeLinkAgendaCorDeFundo = corPrimariaEscuro;
}
