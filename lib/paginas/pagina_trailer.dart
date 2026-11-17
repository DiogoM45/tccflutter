
import 'package:flutter/material.dart';

class PaginaTrailer extends StatelessWidget {
  const PaginaTrailer({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Text(
        'Bem-vindo à página do trailer!',
        style: TextStyle(fontSize: 24, color: Colors.white),
      ),
    );
  }
}