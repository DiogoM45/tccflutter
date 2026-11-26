
import 'package:flutter/material.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
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
            
      Container(
      width: 800, 
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
      color: const Color.fromARGB(255, 107, 109, 34),
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(
      color: const Color.fromARGB(255, 247, 249, 194),
      width: 4,
      ),
      ),

      child: const Column(
        children: [

          Text(
          'BEM-VINDO',
          textAlign: TextAlign.center,
          style: TextStyle(
          fontSize: 20,
          color: Colors.white,
          fontWeight: FontWeight.bold,
          ),
          ),

          SizedBox(height: 16.0),

          Text(
          'Esta é a página inicial da aplicação mobile do projeto de gamificação da empresa Pomo de Éris feita pela Mechanical Bromance. Nessa aplicação, você encontrará páginas dedicadas ao jogo criado, curiosidades, galeria, exibição do trailer e muito mais!',
          textAlign: TextAlign.justify,
          style: TextStyle(
          fontSize: 12,
          color: Colors.white70,
          fontFamily: 'Roboto',
          height: 1.5,
          fontWeight: FontWeight.bold,
          ),
          ),
          ],
          ),
          ),

          const SizedBox(height: 48.0),


          Wrap(
          spacing: 16.0,
          runSpacing: 16.0,
          alignment: WrapAlignment.center,
          children: [
             _construirCartaoIcone(Icons.home_outlined, 'Início'),
            _construirCartaoIcone(Icons.sports_esports, 'Jogo'),
            _construirCartaoIcone(Icons.camera_alt_rounded, 'Galeria'),
            _construirCartaoIcone(Icons.auto_awesome, 'Curiosidades'),
            _construirCartaoIcone(Icons.groups_outlined, 'Créditos'),
            _construirCartaoIcone(Icons.construction_rounded, 'Empresa'),
            _construirCartaoIcone(Icons.play_arrow_rounded, 'Trailer'),
            ],
            ),
            ],
            ),
            ),
            );
            }

  Widget _construirCartaoIcone(IconData icone, String titulo) { //função q constroi os cartãos
    return Container(
      width: 120,
      height: 120,
      decoration: BoxDecoration(
      color: const Color.fromARGB(255, 107, 109, 34), 
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(
      color: const Color.fromARGB(255, 247, 249, 194),
      width: 3,
      ),
      ),

      child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [

          Icon(
          icone,
          size: 40,
          color: Colors.white,
          ),

          const SizedBox(height: 12.0),

          Text(
          titulo,
          textAlign: TextAlign.center,
          style: const TextStyle(
          fontSize: 9,
          color: Colors.white,
          ),
          ),
          ],
          ),
          );
          }
          }