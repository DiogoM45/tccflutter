import 'dart:convert';
import 'package:flutter/services.dart';


Future<List<dynamic>> carregarJson(String caminho) async {
  final String jsonString = await rootBundle.loadString(caminho);
  return jsonDecode(jsonString);
}

Future<List<dynamic>> carregarIcones() {
  return carregarJson('assets/json/icones.json');
}


Future<List<dynamic>> carregarBotoes() {
  return carregarJson('assets/json/botoes.json');
}

Future<Map<String, List<dynamic>>> carregarDadosBotoesEIcones() async {
  final List<List<dynamic>> resultados = await Future.wait<List<dynamic>>([
    carregarBotoes(),
    carregarIcones(),
  ]);

  return {
    'botoes': resultados[0],
    'icones': resultados[1],
  };
}

