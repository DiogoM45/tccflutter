class ImagemGaleria { //define dados de cada imagem
  final String titulo;
  final String descricao;
  final String caminhoImagem;
  final String grupo; //o que define as imagens associadas aos botões

  const ImagemGaleria({
    required this.titulo,
    required this.descricao,
    required this.caminhoImagem,
    required this.grupo,
  });
}