import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'paginas/pagina_inicio.dart';

Future<List<dynamic>> carregarJson(String caminho) async {
  final String jsonString = await rootBundle.loadString(caminho);
  return jsonDecode(jsonString);
}

Future<List<dynamic>> carregarIcones() {
  return carregarJson('assets/json/icones.json');
}

Future<List<dynamic>> carregarImagens() {
  return carregarJson('assets/json/imagens.json');
}

Future<List<dynamic>> carregarBotoes() {
  return carregarJson('assets/json/botoes.json');
}

Future<List<dynamic>> carregarTextos() {
  return carregarJson('assets/json/textos.json');
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

IconData obterIcone(String nome) {
  switch (nome) {
    case 'sports_esports':
      return Icons.sports_esports;

    case 'home':
      return Icons.home_outlined;

    case 'info':
      return Icons.info_outline;

    case 'photo_library':
      return Icons.photo_library_outlined;

    case 'groups':
      return Icons.groups_outlined;

    case 'camera_alt_rounded':
      return Icons.camera_alt_rounded;

    case 'auto_awesome':
      return Icons.auto_awesome;

    case 'cookie':
      return Icons.cookie;

    case 'play_arrow_rounded':
      return Icons.play_arrow_rounded;

    default:
      return Icons.help_outline;
  }
}

Text construirTexto(
  Map<String, dynamic> dados) {
  return Text(
    dados['texto'],
    textAlign: dados['alinhamento'] == 'center'
        ? TextAlign.center
        : dados['alinhamento'] == 'right'
        ? TextAlign.right
        : TextAlign.left,
    style: TextStyle(
      color: Color(
        int.parse(dados['cor'].substring(1), radix: 16) + 0xFF000000,
      ),
      fontSize: dados['tamanho'].toDouble(),
      fontWeight: dados['peso'] == 'bold' ? FontWeight.bold : FontWeight.normal,
      height: dados['altura_linha'].toDouble(),
    ),
  );
}

IconButton construirBotao(
  Map<String, dynamic> dadosBotao,
  List<dynamic> icones,) {
  final icone = icones.firstWhere(
    (item) => item['id'] == dadosBotao['icone_id'],
    orElse: () => {
      'nome': 'help_outline',
      'cor': '#FFFFFF',
      'tamanho': 24,
    },
  );
  final corBotao = Color(
    int.parse(
      dadosBotao['cor'].substring(1),
      radix: 16,
    ) + 0xFF000000,
  );

  final corIcone = Color(
    int.parse(
      icone['cor'].substring(1),
      radix: 16,
    ) + 0xFF000000,
  );

  return IconButton(
    tooltip: dadosBotao['nome'],
    onPressed: () {},
    iconSize: (icone['tamanho'] as num).toDouble(),
    icon: Icon(
      obterIcone(icone['nome']),
      color: corIcone,
    ),
    style: IconButton.styleFrom(
      fixedSize: Size(
        (dadosBotao['tamanho_botao'] as num).toDouble(),
        (dadosBotao['tamanho_botao'] as num).toDouble(),
      ),
      padding: EdgeInsets.all(
        (dadosBotao['padding'] as num).toDouble(),
      ),
      backgroundColor: corBotao,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(
          (dadosBotao['arredondamento'] as num).toDouble(),
        ),
      ),
    ),
  );
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'oitudobem'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,

        children: [
          Container(
            width: 100,
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
            color: const Color.fromRGBO(33, 45, 64, 1),
            border: Border.all(
              color: const Color.fromRGBO(214, 104, 83, 1),
              width: 5,
            ),
          ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                FutureBuilder<Map<String, List<dynamic>>>(
                  future: carregarDadosBotoesEIcones(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const CircularProgressIndicator();
                    }

                    if (snapshot.hasError) {
                      return Text(
                        'Erro ao carregar dados:\n\n${snapshot.error}',
                        textAlign: TextAlign.center,
                      );
                    }

                    if (!snapshot.hasData ||
                        snapshot.data!['botoes']!.isEmpty ||
                        snapshot.data!['icones']!.isEmpty) {
                      return const Text('Nenhum dado encontrado.');
                    }

                    final botoes = snapshot.data!['botoes']!;
                    final icones = snapshot.data!['icones']!;

                        return Column(
                        children: botoes.map((botao) {
                         return Padding(
                          padding: const EdgeInsets.only(bottom: 24.0),
                           child: construirBotao(
                          Map<String, dynamic>.from(botao),
                           icones,
                           ),
                          );
                        }).toList(),
                  );
                  },
                ),
              ], //fim do children do column

            ),
          ),

Expanded(
child: Container(
alignment: Alignment.center,
decoration: BoxDecoration(
gradient: LinearGradient(
colors: [
const Color.fromRGBO(10, 16, 43, 1),
const Color.fromRGBO(10, 16, 43, 1),
 ],
begin: Alignment.topCenter,
end: Alignment.bottomCenter,
),
),
child: const PaginaInicio(),
),
),
], //fim do children do row
),
);
}
}
