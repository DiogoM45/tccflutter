import 'package:flutter/material.dart';

class PaginaJogo extends StatelessWidget {
  const PaginaJogo({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Bem-vindo à página do jogo!',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}