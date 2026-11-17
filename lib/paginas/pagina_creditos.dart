import 'package:flutter/material.dart';
import '../dados/credito.dart';
import '../construtores/construircreditos.dart'; 

class PaginaCreditos extends StatefulWidget {
  const PaginaCreditos({super.key});

  @override
  State<PaginaCreditos> createState() => _PaginaCreditosState();
}

class _PaginaCreditosState extends State<PaginaCreditos> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar( //scrollbar criada, mas só widget
      controller: _scrollController, //controlador do scroll
      thumbVisibility: true,
        child: SingleChildScrollView( //singlechildscrollview q usa de coontrole o scrollController e sempre permite scrollar, mesmo q n tenha conteúdo suficiente pra isso (tem)
          controller: _scrollController, 
          physics: const AlwaysScrollableScrollPhysics(),
          padding: const EdgeInsets.only( //padding pros cartões n tocarem o botão hamburger
            top: 80.0, 
            left: 24.0,
            right: 24.0,
            bottom: 40.0,
          ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 24.0),
                    Wrap( //wrap pra caso a tela seja pequena, os cartões se ajustarem e não sairem da tela
                      spacing: 24.0,
                      runSpacing: 24.0,
                      alignment: WrapAlignment.center,
                      children: creditos.map(construirCartaoCredito).toList(), //pega os valores de dado e monta através do construir créditos a página
                  ),
                  ],
                  ),
                  ),
                  );
                  }
                  }