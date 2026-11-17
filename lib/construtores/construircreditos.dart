import 'package:flutter/material.dart';
import '../modelos/credito.dart';

Widget construirCartaoCredito(Credito credito) {
  return SizedBox(
    width: 220, 
    child: Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
      color: const Color.fromRGBO(0, 0, 0, 1),
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(
      color: const Color.fromRGBO(189, 42, 13, 1),
       width: 5,
      ),
      ),
      padding: const EdgeInsets.all(6.0),

    child: Column(
    mainAxisSize: MainAxisSize.min,
    children: [
     const SizedBox(height: 16.0),

         
    Container(
    clipBehavior: Clip.antiAlias,
    decoration: BoxDecoration(
    color: const Color.fromRGBO(132, 147, 171, 1),
    borderRadius: BorderRadius.circular(15.0),
    border: Border.all(
    color: const Color.fromARGB(255, 118, 63, 51),
    width: 5,
    ),
    ),
    padding: const EdgeInsets.all(2.0),
    child: Image.asset(
      credito.caminhoImagem,
      width: 150,
      height: 150,
      fit: BoxFit.cover,
      errorBuilder: (context, error, stack) => const SizedBox(
        width: 150,
        height: 150,
        child: Icon(Icons.person, size: 80, color: Colors.white),
        ),
        ),
        ),

        const SizedBox(height: 16.0),

      Text(
        credito.nome,
        textAlign: TextAlign.center,
        style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        ),
        ),

          
        const SizedBox(height: 4.0),
        if (credito.descricao != null && credito.descricao!.isNotEmpty) ...[
          Text(
          credito.descricao!,
          textAlign: TextAlign.center,
          style: const TextStyle(
          fontSize: 12,
          color: Colors.white,
          fontFamily: 'Roboto',
          ),
          ),
          ],

          const SizedBox(height: 4.0),

          Text(
          credito.cargo,
          textAlign: TextAlign.center,
          style: const TextStyle(
          fontSize: 10,
          color: Colors.white,
          fontFamily: 'Roboto',
          ),
          ),

          const SizedBox(height: 12.0),
        ],
        ),
        ),
        );
        }