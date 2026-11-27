import 'package:flutter/material.dart';

class PaginaJogo extends StatefulWidget {
  const PaginaJogo({super.key});

  @override
  State<PaginaJogo> createState() => _PaginaJogoState();
}

class _PaginaJogoState extends State<PaginaJogo> {
  final ScrollController _scrollController = ScrollController();
  
  int _abaSelecionada = 0; //começa no valor 0
  
  final List<String> _abas = ['Personagens', 'Minigames', 'Interface', 'Mecânicas']; //array com o número de "partes"

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
      'ULTIMATE CLINIC SIMULATOR',
      style: TextStyle(fontSize: 24, color: Colors.white),
      ),

      const SizedBox(height: 32.0),
     
      Wrap(
      spacing: 12.0,
      runSpacing: 12.0,
      alignment: WrapAlignment.center,
      children:

      _abas.asMap().entries.map((entry) { //asMap().entries traz também valores de indice (para trocar o valor de aba selecionada)
      int index = entry.key; //pega o número
      String nomeAba = entry.value; //pega o texto
      bool selecionado = _abaSelecionada == index;

    return ChoiceChip( //botões selecionaveis
      label: Text(nomeAba), //nome do botão = nomeAba = valor de entrada = 0,1,2,3 do array
      selected: selecionado, 
      onSelected: (bool selected) {
      setState(() { //set state q muda o valor da aba selecionada
      _abaSelecionada = index; 
      });
      },
      selectedColor: const Color.fromRGBO(214, 104, 83, 1),
      backgroundColor: const Color.fromRGBO(33, 45, 64, 1),
      labelStyle: TextStyle(
      color: selecionado ? Colors.white : Colors.white70,
      fontFamily: 'Roboto',
      ),
      side: const BorderSide(
      color: Color.fromRGBO(214, 104, 83, 1),
      width: 2,
      ),
      );
      }).toList(),
      ),

      const SizedBox(height: 32.0),

      _construirConteudo(), //chama a função para construir o conteúdo
      ],
      ),
      ),
      );
      }

    Widget _construirConteudo() {
    switch (_abaSelecionada) { //troca a exibição dependendo do valor recebido, recebendo valores diferentes graças ao SetState()

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      case 0: //personagens
      return Column(
      children: [

        _criarCardTexto(
        titulo: 'Mab, O Protagonista',
        texto: 'No universo do jogo, Mab é um robô funcionário experiente que foi contratado pela empresa por falta de mão de obra. Ele já tem anos de experiência na clínica, e se tornou quase um mascote da clínica com o passar do tempo, com entusiastas de todos os lugares do mundo querendo ter uma sessão com o "robô massagista"',
        ),

        Container(
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/personagens/mabperfil.jpg', width: 600),
        ),

         _criarCardTexto(
        titulo: 'Lana, A Cliente',
        texto: 'Lana é uma cliente veterana da clínica, que após um tempo sem marcar nenhuma consulta, se espanta com a notícia do funcionário distinto dos outros e marca uma tarde na clínica para conhecer Mab e suas tão faladas habilidades.',
        ),       

        Container(
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/personagens/lanaperfil.jpg', width: 600),
        ),

        ],
        );

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      case 1: //minigames
      return Column(
        children: [

        _criarCardTexto(
        titulo: 'Massagem',
        texto: 'O minigame de massagem tem como objetivo o acerto com o mouse nas bolinhas rosas que aparecem na tela, representando pontos de tensão. As bolinhas vermelhas devem ser evitadas, já que machucam a cliente e subtraem pontos do jogador.',
        ),

        Container(
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/minigames/massagem.jpeg', width: 600),
        ),

        _criarCardTexto(
        titulo: 'Manicure',
        texto: 'Para o minigame de manicure, foi criada uma interação onde a cliente pede um sìmbolo ou desenho simples em sua unha, onde o jogador deve usar de cores e desenhos já prontos para montar o diagrama solicitado pela cliente. Quanto mais parecido estiver, mais pontos.',
        ),

        Container(
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/minigames/manicure.jpeg', width: 600),
        ),

        _criarCardTexto(
        titulo: 'Depilação',
        texto: 'Para o procedimento de Depilação, o jogador deve trabalhar em etapas, com a primeira etapa sendo a raspagem dos pelos, a segunda a passagem de cera sobre a pele da cliente e por último a remoção da cera, onde um teste de pericia surge para proceder com a remoção da cera sem machucar a cliente. Faça todos as etapas dentro do tempo solicitado e não erre o teste de perícia e os pontos serão seus. ',
        ),

        Container(
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/minigames/depilação.jpeg', width: 600),
        ),

        _criarCardTexto(
        titulo: 'Bronzeamento',
        texto: 'O minigame de Bronzeamento é simples, você deve escolher a "tinta" certa de acordo com a solicitação da cliente e passar sobre suas costas. A condição de vitória consiste na velocidade do processo de pintar as costas da cliente e no acerto de cor solicitada.',
        ),

        Container(
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/minigames/bronzeamento.jpeg', width: 600),
        ),

        _criarCardTexto(
        titulo: 'Hidromassagem',
        texto: 'O minigame de Hidromassagem funciona através da interpretação de problemas comunicados pela cliente e noção de quantidade do jogador, onde você deve escolher entre uma lista de produtos de relaxamento qual melhor se aplica ao problema da cliente, e também, colocar o produto na banheira na medida certa. A quantidade de pontos depende da escolha certa de produto e da quantidade colocada.',
        ),

        Container(
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/minigames/hidromassagem.jpeg', width: 600),
        ),

        _criarCardTexto(
        titulo: 'Micro Pigmentação',
        texto: 'No minigame de micropigmentação, você pinta a sombracelha da cliente com base na cor de micro pigmento que ela desejar, similar ao minigame de Bronzeamento. A condição de vitória depende da similiaridade de cor que a cliente solicitou.',
        ),

        Container(
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/minigames/micro.jpg', width: 600),
        ),

        ],
        );

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      case 2: //interface
      return Column(
      children: [

        _criarCardTexto(
        titulo: 'Menu Inicial',
        texto: 'O menu inicial da Gamificação apresenta 4 diferentes funções, a Primeira é a Iniciar, que inicia o jogo em si. A função de opções com funções de controle de áudio sobre efeitos sonoros e música, opção de dicas e sensibilidade do mouse. A função de créditos exibe os créditos dos envolvidos na criação do jogo, e o botão de sair encerra o jogo.',
        ),

        Container(
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/interface/menuprincipal.jpg', width: 600),
        ),

        _criarCardTexto(
        titulo: 'Menu de Pausa',
        texto: 'O menu de pausa não é tão diferente do menu de início, apresentando opções de continuar o jogo e fechar o menu, um botão de opções assim como no menu inicial e um botão de sair.',
        ),

        Container(
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/interface/menupausa.jpeg', width: 600),
        ),

        _criarCardTexto(
        titulo: 'Lista de Afazeres',
        texto: 'A lista de afazeres é uma pequena constante folha de papel no canto da tela que tem como propriedade a exibição dos procedimentos já feitos e ainda não feitos pelo jogador, facilitando a organização do jogador durante a jogatina.',
        ),

        Container(
        width: 400, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/interface/procedimentos.jpg', width: 600),
        ),

        ],
        );

//>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>>

      case 3: //mecânicas
      return Column(
      children: [
            
        _criarCardTexto(
        titulo: 'Movimentação',
        texto: 'A movimentação de Mab se define no padrão de movimentação do mundo dos jogos, W move o personagem para frente, A e D para esquerda e direita respectivamente e S para trás.',
        ),

        Container(
        width: 600, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/wasd.png', width: 600),
        ),

        _criarCardTexto(
        titulo: 'Câmera',
        texto: 'A câmera do jogo mostra uma perspectiva em primeira pessoa de Mab, simulando o que o personagem estaria "enxergando" ao se locomover pela clínica.',
        ),

        
        Container(
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/visaomab.jpeg', width: 600),
        ),
        

        _criarCardTexto(
        titulo: 'Interação com Minigames',
        texto: 'Para iniciar os minigames, o jogador tem que se deslocar até os objetos relacionados ao minigame buscado, por exemplo,  interagir com a cadeira inicia o minigame de massagem, interagir com a banheira, inicia o de Hidromassagem etc. Para interagir com um objeto e iniciar um minigame, é necessário pressionar a tecla E.',
        ),

        Container(
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),
        child: Image.asset('assets/imagens/galeria/minigames/solitacaobotao.jpeg', width: 600),
        ),

        ],
        );

        default: //default caso nao tenha nada n mostra nada
        return const SizedBox.shrink();
        }
        }

      Widget _criarCardTexto({required String titulo, required String texto}) { //função para criar os cartões, tipo a estrutura modelo > dado > construtor mas na mesma página
      return Container( //container 
        width: 800, 
        margin: const EdgeInsets.only(bottom: 24.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
        color: const Color.fromRGBO(33, 45, 64, 1),
        borderRadius: BorderRadius.circular(15.0),
        border: Border.all(
        color: const Color.fromRGBO(214, 104, 83, 1),
        width: 4,
        ),
        ),

        child: Column( //coluna dentro dos containers
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [

        Text( //titulo
        titulo,
        style: const TextStyle(
        fontSize: 18,
        color: Colors.white,
        fontWeight: FontWeight.bold,
        ),
        ),

        const SizedBox(height: 12.0),

        Text( //texto
        texto,
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
        }