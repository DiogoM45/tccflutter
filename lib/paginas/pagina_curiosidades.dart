import 'package:flutter/material.dart';
import '../dados/curiosidades.dart';
import '../construtores/construir_curiosidade.dart';

class PaginaCuriosidades extends StatefulWidget { 
  const PaginaCuriosidades({super.key});

  @override
  State<PaginaCuriosidades> createState() => _PaginaCuriosidadesState();
}

class _PaginaCuriosidadesState extends State<PaginaCuriosidades> {
  final ScrollController _scrollController = ScrollController();

  @override
  void dispose() {
  _scrollController.dispose();
  super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
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
      'CURIOSIDADES',
      style: TextStyle(fontSize: 24, color: Colors.white),
      ),

      const SizedBox(height: 32.0),

      ...curiosidades.map(construirCardCuriosidade), //spread operator, que pega todos os itens e cria eles, espalhando eles

      ],
      ),
      ),
      );
      }
      }