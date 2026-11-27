import '../modelos/credito.dart';

const List<Credito> creditos = [ //uma array com os dados que seguem o modelo de dados de credito, graças ao import ali em cima....

  Credito(
    nome: 'Luan Henrique Prado dos Santos Donizete',
    cargo: 'LÍDER DE EQUIPE E PROGRAMADOR UNITY',
    caminhoImagem: 'assets/imagens/creditos/luan.jpeg',
    descricao: 'Responsável por liderar a equipe, coordenar o desenvolvimento do projeto e contribuir com a programação de aspectos gerais do jogo como movimentação, câmera e interação com ambiente através da engine Unity.',
  ),

  Credito(
    nome: 'Diogo Meireles de Jesus',
    cargo: 'VICE LÍDER, PROGRAMADOR FLUTTER E DOCUMENTADOR',
    caminhoImagem: 'assets/imagens/creditos/diogo.jpeg',
    descricao: 'Responsável por desenvolver a interface do usuário e criação do aplicativo através do Flutter, também responsável por grande parte da documentação principal do projeto.',
  ),
  
  Credito(
    nome: 'Kevin Cavalcante da Silva',
    cargo: 'MODELADOR 3D E DOCUMENTADOR',
    caminhoImagem: 'assets/imagens/creditos/kevin.jpg',
    descricao: 'Responsável pela criação de modelos 3D do ambiente da clínica e texturização de todos os modelos. Além de ter auxiliado na efetuação das documentações gerais do projeto, como tabela de requisitos, diagrama de classes etc.',
  ),

  Credito(
    nome: 'Guilherme Diogo de Morais',
    cargo: 'MODELADOR 3D E DESIGNER',
    caminhoImagem: 'assets/imagens/creditos/guilherme.jpeg',
    descricao: 'Responsável pela criação dos modelos e texturas 3D da cliente "Lana" e do robô protagonista "Mab", além do auxilio também em algumas texturas do ambiente.',
  ),

  Credito(
    nome: 'Vinícius Figueiredo Serra',
    cargo: 'PROGRAMADOR UNITY E DESIGNER',
    caminhoImagem: 'assets/imagens/creditos/figueiredotrue.jpeg',
    descricao: 'Programador Unity responsável pela criação de boa parte dos minigames e outras mecânicas da gamificação, junto com suas observações de design de minigames.  '
  )
];