import 'package:flutter/material.dart';


IconButton construirBotao(
  Map<String, dynamic> dadosBotao,
  List<dynamic> icones,
  VoidCallback aoClicar,
  String? paginaSelecionada,
  ) {

    final bool selecionado =
    dadosBotao['pagina'] == paginaSelecionada;
    final icone = icones.firstWhere(
    (item) => item['id'] == dadosBotao['icone_id'],
    orElse: () => {
    'nome': 'help_outline',
    'cor': '#FFFFFF',
    'tamanho': 24,
    },
    );
  
    final String codigoCorBotao = selecionado
    ? dadosBotao['cor_selecionado']
    : dadosBotao['cor'];

    final corBotao = Color(
    int.parse(
    codigoCorBotao.substring(1),
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
    onPressed: () { 
    aoClicar();
    },
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

    case 'construction_rounded':
      return Icons.construction_rounded;

    case 'play_arrow_rounded':
      return Icons.play_arrow_rounded;

    default:
      return Icons.help_outline;
  }
}