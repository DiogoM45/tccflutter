import 'package:flutter/material.dart';
import '../modelos/curiosidades.dart';

Widget construirCardCuriosidade(Curiosidade curiosidade) {
  return Container(
    width: 600, 
    margin: const EdgeInsets.only(bottom: 24.0),
    padding: const EdgeInsets.all(20.0),
    decoration: BoxDecoration(
    color: const Color.fromARGB(255, 107, 109, 34), 
    borderRadius: BorderRadius.circular(10.0),
    border: Border.all(
    color: const Color.fromARGB(255, 247, 249, 194), 
    width: 3,
    ),
    ),

    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start, //alinhado esquerda
      children: [
        
        Text(
          curiosidade.titulo,
          style: const TextStyle(
          fontSize: 16,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          ),
          ),

          const SizedBox(height: 12.0),

          Text(
          curiosidade.texto,
          style: const TextStyle(
          fontSize: 12,
          color: Colors.white70,
          fontFamily: 'Roboto', 
          height: 1.5, 
          ),
          ),
          ],
          ),
          );
          }