import 'package:flutter/material.dart';


IconButton construirBotao( // função que constrói o botão do menu com base nos dados do json
  Map<String, dynamic> dadosBotao,
  List<dynamic> icones,
  VoidCallback aoClicar,
  String? paginaSelecionada,
  ) {

    final bool selecionado = //usa um bool para verificar se botão = página
    dadosBotao['pagina'] == paginaSelecionada;
    final icone = icones.firstWhere( //procura o icone com base no id
    (item) => item['id'] == dadosBotao['icone_id'],
    orElse: () => {
    'nome': 'help_outline',
    'cor': '#FFFFFF',
    'tamanho': 24,
    },
    );
  
    final String codigoCorBotao = selecionado //define a cor do botão, selecionado = uma cor, não selecionado = outra
    ? dadosBotao['cor_selecionado']
    : dadosBotao['cor'];

    final corBotao = Color( //converte o hexadecimal para o color do flutter
    int.parse(
    codigoCorBotao.substring(1),
    radix: 16,
    ) + 0xFF000000,
    );

    final corIcone = Color(  //converte o hexadecimal para o color do flutter
    int.parse(
    icone['cor'].substring(1),
    radix: 16,
    ) + 0xFF000000,
    );

    return IconButton(   // 6. Monta o widget visual do botão
    tooltip: dadosBotao['nome'],
    onPressed: () { //On pressed = aoClicar
    aoClicar();
    },
    iconSize: (icone['tamanho'] as num).toDouble(), //tamanho do icone
    icon: Icon(
    obterIcone(icone['nome']), //converte string = icone
    color: corIcone,
    ),

    style: IconButton.styleFrom( //aplica as propiedades do json para os botões
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


    IconData obterIcone(String nome) { //traduções de string de icone do json = icones reais
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