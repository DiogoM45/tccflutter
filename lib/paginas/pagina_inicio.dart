import 'package:flutter/material.dart';


class PaginaInicio extends StatelessWidget {
  const PaginaInicio({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min, 
        children: [

        Container(
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
          color: const Color.fromRGBO(33, 45, 64, 1),
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
          color: const Color.fromRGBO(189, 42, 13, 1),
          width: 5,
          ),
          ),

          padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                const SizedBox(height: 16.0),
                    Text(
                    'Bem-vindo à página inicial!',
                    style: TextStyle(fontSize: 24, color: Colors.white, fontFamily: 'Roboto', fontWeight: FontWeight.bold),
                    ),
                    ],
                    ),
                    ),
                    ],
                    ),
                    );
                    }
                    }