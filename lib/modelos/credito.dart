class Credito { //determina o que cada crédito vai ter como dado, tipo uma planta
  final String nome;          
  final String cargo;         
  final String caminhoImagem; 
  final String? descricao; //descrição é opcional, então pode ser nula

  const Credito({
    required this.nome,
    required this.cargo,
    required this.caminhoImagem,
    this.descricao, //n tem required pq é opcional
  });
}