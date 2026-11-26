import 'package:web/web.dart' as web;
import 'dart:ui_web' as ui_web;
import 'package:flutter/material.dart';

class YoutubeIframe extends StatefulWidget {

final String videoId;
const YoutubeIframe({super.key, required this.videoId});

  @override
  State<YoutubeIframe> createState() => _YoutubeIframeState();

}

class _YoutubeIframeState extends State<YoutubeIframe> {
late final String _viewId;
late final web.HTMLIFrameElement _iframeElement;

  @override
  void initState() {
  super.initState();
  _viewId = 'youtube-iframe-${widget.videoId}-${DateTime.now().millisecondsSinceEpoch}';

  _iframeElement = web.HTMLIFrameElement()
    ..src = 'https://www.youtube.com/embed/${widget.videoId}'
    ..style.border = 'none'
    ..style.width = '100%'
    ..style.height = '100%'
    ..allow = 'accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture'
    ..allowFullscreen = true;

    ui_web.platformViewRegistry.registerViewFactory(
    _viewId,
    (int viewId) => _iframeElement,
    );
    }

    @override
    Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewId);
  }
}