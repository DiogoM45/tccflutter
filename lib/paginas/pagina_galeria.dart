import 'package:flutter/material.dart';
import '../dados/galeria.dart';
import '../construtores/construir_galeria.dart';

class PaginaGaleria extends StatefulWidget { //stateful já que tem reagir com cliques
  const PaginaGaleria({super.key});

  @override
  State<PaginaGaleria> createState() => _PaginaGaleriaState();
}

class _PaginaGaleriaState extends State<PaginaGaleria> {
final ScrollController _scrollController = ScrollController(); //para descer a página
final List<String> _grupos = ['Todos', 'Personagens', 'Minigames', 'Interface']; //todos os grupos
  
String _grupoSelecionado = 'Todos'; //default

  @override
  void dispose() {
  _scrollController.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final imagensFiltradas = _grupoSelecionado == 'Todos' //mostra todas as imagens
    ? galeria
    : galeria.where((img) => img.grupo == _grupoSelecionado).toList(); //propiedade where que procura as imagens com a string grupo que você selecionou e só exibe elas

    return Scrollbar( //controle para descer
      controller: _scrollController,
      thumbVisibility: true,

      child: SingleChildScrollView(
      controller: _scrollController,
      padding: const EdgeInsets.only(
      top: 80.0, 
      left: 24.0,
      right: 24.0,
      bottom: 40.0,
      ),

      child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [

      const Text(
      'GALERIA DO JOGO',
      style: TextStyle(fontSize: 24, color: Colors.white),
      ),

      const SizedBox(height: 24.0),

      Wrap( //muda a ordem se a tela for pequena
      spacing: 12.0,
      runSpacing: 12.0,
      alignment: WrapAlignment.center,
      children: _grupos.map((grupo) {  //mapeamento dos grupos 
      final bool selecionado = _grupoSelecionado == grupo; 
                
      return ChoiceChip( //botão "selecionavel" 
        label: Text(grupo), //o nome do botão = grupo que ele pertence
        selected: selecionado, 
        onSelected: (bool selected) { //mesmo que "on pressed" define 
        setState(() { //set state pra mudar o estado do botão
        _grupoSelecionado = grupo; //muda o grupo selecionado pro grupo de valor do botão
        });
        },

        selectedColor: const Color.fromARGB(255, 112, 70, 106),
        backgroundColor: const Color.fromARGB(255, 107, 109, 34), //cor quando não ta selecionado
        labelStyle: TextStyle(
          color: selecionado ? Colors.white : Colors.white70, //cor da fonte
          fontFamily: 'Roboto',
          ),
          side: const BorderSide(
          color: Color.fromRGBO(177, 214, 83, 1), //cor da borda
          width: 2,
          ),
          );
          }).toList(),
          ),

          const SizedBox(height: 32.0),


          Wrap(
          spacing: 24.0,
          runSpacing: 24.0,
          alignment: WrapAlignment.center,
          children: imagensFiltradas.map(construirImagemGaleria).toList(), //usa o builder para construir as imagens filtradas, wrap para mandar para baixo caso sem espaço
          ),
          ],
          ),
          ),
          );
          }
          }