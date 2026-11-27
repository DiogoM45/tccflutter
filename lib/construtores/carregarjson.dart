import 'dart:convert'; //possui json decode, transforma texto do json em objetos do dart
import 'package:flutter/services.dart'; //rootBundle q procura arquivos nos assets


Future<List<dynamic>> carregarJson(String caminho) async { //função q recebe o caminho do arquivo 
final String jsonString = await rootBundle.loadString(caminho); //lê o arquivo como string
return jsonDecode(jsonString); //json string > dart
}

Future<List<dynamic>> carregarIcones() { //future = retorna quando a leitura terminar "no futuro"
return carregarJson('assets/json/icones.json'); //carrega icones dessa pasta especifica
}


Future<List<dynamic>> carregarBotoes() {
return carregarJson('assets/json/botoes.json'); //carrega botoes dessa pasta especifica
}

Future<Map<String, List<dynamic>>> carregarDadosBotoesEIcones() async {
final List<List<dynamic>> resultados = await Future.wait<List<dynamic>>([ //espera um valor terminar para lançar os dois juntos
carregarBotoes(),
carregarIcones(),
]);

  return {
  'botoes': resultados[0],
  'icones': resultados[1],
  };
  }

