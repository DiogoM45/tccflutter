import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'paginas/pagina_inicio.dart';
import 'paginas/pagina_jogo.dart';
import 'paginas/pagina_galeria.dart';
import 'paginas/pagina_curiosidades.dart';
import 'paginas/pagina_creditos.dart';
import 'paginas/pagina_empresa.dart';
import 'paginas/pagina_trailer.dart';
import 'construtores/construir_botoes.dart';
import 'construtores/carregarjson.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false, //tira o debug quando rodar aplicação
      home: const MyHomePage(title: 'oitudobem'),

        theme: ThemeData(
        fontFamily: GoogleFonts.pressStart2p().fontFamily,
        ),
      );
    }
  }


class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}


class _MyHomePageState extends State<MyHomePage> {

  late Future<Map<String, List<dynamic>>> _dadosMenu;

  @override
  void initState() {
    super.initState();
    _dadosMenu = carregarDadosBotoesEIcones(); 
  }

  bool menuAberto = false;
  String? paginaSelecionada;

  Widget construirBarraLateral() { // construi a barra lateral com os botões
      return Container( // contém a barra lateral
      width: 250,
      padding: const EdgeInsets.all(8.0),
      decoration: BoxDecoration(
      color: const Color.fromARGB(255, 184, 144, 153),
      border: Border.all(
      color: const Color.fromARGB(255, 247, 249, 194),
      width: 10,
      ),
      ),

    child: Column( // coluna que organiza os botões e o ícone de fechar
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [

    IconButton( //botão pra fechar o menu, que transforma a variável menuAberto em false, fechando o menu
      tooltip: 'Fechar menu',
      onPressed: () {
      setState(() {
      menuAberto = false;
      });
      },
      icon: const Icon(
      Icons.close,
      color: Colors.white,
      ),
      ),

    Expanded( //expanded que traz através do futurebuilder os dados do json e constrói os botões
      child: FutureBuilder<Map<String, List<dynamic>>>(
      future: _dadosMenu,
      builder: (context, snapshot) {

      if (snapshot.connectionState == ConnectionState.waiting) { //se a função ainda estiver carregando, mostra um circulo de progresso
      return const Center(
        child: CircularProgressIndicator(),
        );
        }

      if (snapshot.hasError) { //se a função der erro, mostra uma mensagem de erro
      return Text(
        'Erro ao carregar dados:\n${snapshot.error}',
        style: const TextStyle(color: Colors.white),
        );
        }

      if (!snapshot.hasData || //se a função não tiver dados, mostra uma mensagem de erro
        snapshot.data!['botoes']!.isEmpty ||
        snapshot.data!['icones']!.isEmpty) {
      return const Text(
        'Nenhum dado encontrado.',
        style: TextStyle(color: Colors.white),
        );
        }

      final botoes = snapshot.data!['botoes']!; //pega os dados do json e transforma em uma lista de botões
      final icones = snapshot.data!['icones']!; //pega os dados do json para gerar ícones para os botões

       return SingleChildScrollView( //singlescrollview que permite rolar a barra lateral caso os botões não caibam na tela....
        child: Column(
          children: botoes.map<Widget>((botao) { //mapeia/loopa os botões do json e chama a função construirBotao para construir os botões na barra lateral

        final dadosBotao = Map<String, dynamic>.from(botao); //determina a página que o botão vai abrir, pegando do json a chave 'pagina' e transformando em uma string q vai ser reconhecida pelo operador ternário lá embaixoooo
          return Padding(
            padding: const EdgeInsets.only(
            bottom: 24.0,
            ),

              child: construirBotao(
              dadosBotao,
              icones,     
              () {
              setState(() {
              paginaSelecionada = dadosBotao['pagina']; //muda o valor de página selecionado para o valor que o último botão possui em seu json
              menuAberto = false;
              });
              },
              paginaSelecionada,
              ),
              );
              }).toList(),
              ),
              );
              },
              ),
              ),
              ],
              ),
              );
              }

    Widget construirConteudo() {
      return Container( // container que graças ao Positioned.fill do stack, preenche toda a tela e recebe o conteúdo da página selecionada
      decoration: const BoxDecoration(
      gradient: LinearGradient(
      colors: [
            Color.fromRGBO(230, 132, 155, 1),
            Color.fromRGBO(230, 132, 155, 1),
          ],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      ),
      ),

        child: paginaSelecionada == 'inicio' //corrente de operadores ternários que vê qual página foi selecionada e mostra o conteúdo da página correspondente, caso nenhuma seja selecionada, mostra um sizedbox.shrink() que é um widget vazio pra tela ficar limpa
          ? const PaginaInicio() //a relação de condição ? true : false se aplica em todas...
          : paginaSelecionada == 'jogo'
              ? const PaginaJogo()
              : paginaSelecionada == 'galeria'
                  ? const PaginaGaleria()
                  : paginaSelecionada == 'curiosidades'
                      ? const PaginaCuriosidades()
                      : paginaSelecionada == 'creditos'
                          ? const PaginaCreditos()
                          : paginaSelecionada == 'empresa'
                              ? const PaginaEmpresa()
                              : paginaSelecionada == 'trailer'
                                  ? const PaginaTrailer()
                                  : const SizedBox.shrink(),
                                  );
                                  }


 

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        body: Stack( //stack que inicialmente mostra a tela de fundo com o conteúdo da página selecionada, (lemnbra do container lá em cima?)
        children: [
        Positioned.fill(
        child: construirConteudo(),
        ),

      if (menuAberto) //escurece o background quando o menu de botões está aberto, e muda o valor do menu de botões aberto atráves do set state para falso
      Positioned.fill(
      child: GestureDetector(
        onTap: () {
        setState(() {
        menuAberto = false;
        });
        },

        child: Container(
        color: Colors.black54,
        ),
        ),
        ),

        if (menuAberto) //se o menu for aberto, mostra o menu 
          Positioned(
          left: 0,
          top: 0,
          bottom: 0,
          child: construirBarraLateral(),
          ),

        if (!menuAberto) //botão hamburger que serve de gatilho para abrir o menu
          Positioned(
          left: 12,
          top: 12,
          child: Container( //container para o botão hamburger ficar bonitinho, com borda e arredondado
            decoration: BoxDecoration(
            color: const Color.fromARGB(255, 164, 175, 122),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
            color: const Color.fromARGB(255, 247, 249, 194),
            width: 6,
            ),
            ),

            child: IconButton( //botao hamburger q muda o valor do menu pra aberto, trazendo algumas das funções ali em cima
            tooltip: 'Abrir menu',
            onPressed: () {
            setState(() {
            menuAberto = true;
            });
            },
            icon: const Icon(
            Icons.menu,
            color: Color.fromARGB(255, 255, 255, 255),
            ),
            ),
            ),
            ),
            ],
            ),
            );
            }
            }
