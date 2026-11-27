import 'package:flutter/material.dart';
import 'package:web/web.dart' as web;
import 'dart:ui_web' as ui_web;  

class PaginaTrailer extends StatefulWidget {
  const PaginaTrailer({super.key});

  @override
  State<PaginaTrailer> createState() => _PaginaTrailerState();
}

class _PaginaTrailerState extends State<PaginaTrailer> {
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
      'TRAILER',
      style: TextStyle(fontSize: 24, color: Colors.white),
      ),

      const SizedBox(height: 32.0),
            
      Container(
      width: 800, 
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
      color: const Color.fromARGB(255, 107, 109, 34),
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(
      color: const Color.fromARGB(255, 247, 249, 194), 
      width: 4,
      ),
      ),

      child: ClipRRect( //corta as bordas do vídeo
      borderRadius: BorderRadius.circular(8.0), 

      child: AspectRatio(
      aspectRatio: 16 / 9, //mantém o tamanho padrão de um vídeo do youtube independente do tamanho da tela

      child: YoutubeIframe(videoId: 'Adi5VLLeuAI?si=-Kr8bNjHMd6g0fcT'), //widget personalizado
      ),
      ),
      ),
      ],
      ),
      ),
      );
      }
      }

      class YoutubeIframe extends StatefulWidget { 
      final String videoId;
      const YoutubeIframe({super.key, required this.videoId});

      @override
      State<YoutubeIframe> createState() => _YoutubeIframeState();
      }

      class _YoutubeIframeState extends State<YoutubeIframe> {
      late final String _viewId;

      @override
      void initState() {
      super.initState();

      _viewId = 'youtube-iframe-${widget.videoId}-${DateTime.now().millisecondsSinceEpoch}'; //nome único pro vídeo para não ter sobreposição


        final web.HTMLIFrameElement iframe = web.HTMLIFrameElement() //usa o pacote web para pegar valores do navegador e da janela de vídeo do youtube e suas propiedades
      ..src = 'https://www.youtube.com/embed/${widget.videoId}'
      ..style.border = 'none'
      ..style.width = '100%'
      ..style.height = '100%'
      ..allow = 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture'
      ..allowFullscreen = true;


      ui_web.platformViewRegistry.registerViewFactory( //informa o flutter para usar o iframe criado para "desenhar o viewId"
      _viewId,
      (int viewId) => iframe,
      );
      }

      @override
      Widget build(BuildContext context) {
      return HtmlElementView(viewType: _viewId); //coloca o viewId (vídeo) no canvas do flutter
      }
      }