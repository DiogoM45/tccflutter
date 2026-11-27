import 'package:flutter/material.dart';
import '../modelos/imagem_galeria.dart';

Widget construirImagemGaleria(ImagemGaleria imagem) { //constroi o cartão para cada imagem
  return SizedBox(
    width: 250, 
    child: Column( //column que determina a organização dos cartões da imagem

      mainAxisSize: MainAxisSize.min,
      children: [  

        Container( 
          clipBehavior: Clip.antiAlias,
          decoration: BoxDecoration(
          color: const Color.fromARGB(255, 107, 109, 34),
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
          color: const Color.fromARGB(255, 247, 249, 194),
          width: 3,
          ),
          ),
          
          child: Image.asset( //pega a imagem e coloca no container
            imagem.caminhoImagem,
            height: 180,
            width: 250,
            fit: BoxFit.cover, 
            errorBuilder: (context, error, stack) => const SizedBox(
            height: 180,
            child: Icon(Icons.broken_image, size: 50, color: Colors.white),
            ),
            ),
            ),
        
        const SizedBox(height: 8.0),

      Text( //texto de titulo da imagem
      imagem.titulo,
      textAlign: TextAlign.center,
      style: const TextStyle(
      fontSize: 16,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      ),
      ),

      const SizedBox(height: 4.0),

      Text(
        imagem.descricao, //descrição da imagem
        textAlign: TextAlign.center,
        style: const TextStyle(
        fontSize: 10,
        color: Colors.white70, 
        fontFamily: 'Roboto',
        ),
        ),

        const SizedBox(height: 16.0), 

        ],
        ),
        );
        }