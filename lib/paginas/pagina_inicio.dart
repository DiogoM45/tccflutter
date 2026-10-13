
import 'package:flutter/material.dart';


class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
          'Bem-vindo à página inicial!',
          style: const TextStyle(fontSize: 24),
        ),
       
      );
  }
}