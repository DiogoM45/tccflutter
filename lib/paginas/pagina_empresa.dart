import 'package:flutter/material.dart';

class PaginaEmpresa extends StatefulWidget {
  const PaginaEmpresa({super.key});

  @override
  State<PaginaEmpresa> createState() => _PaginaEmpresaState(); //página em layout linear!!
}

class _PaginaEmpresaState extends State<PaginaEmpresa> {
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
            
      _criarCardTexto( 
      titulo: 'Sobre a Empresa',
      texto: 'A Mechanical Bromance é uma empresa direcionada ao desenvolvimento de softwares, tendo como objetivo a criação de soluções tecnológicas e modernas para atender às necessidades de seus clientes e suas solicitações. A firma tem como prioridade a boa comunicação com seu público e associados, entendendo seus requerimentos e oferecendo soluções práticas e efetivas. O slogan “Com grandes programas vêm grandes possibilidades”, indica o potencial que a tecnologia possui de facilitar tarefas, melhorar processos, e criar novas oportunidades para seus clientes.',
      corBorda: const Color.fromARGB(255, 168, 83, 214),
      ),

      _criarCardTexto(
      titulo: 'Nossa História',
      texto: 'A empresa se consolidou em 2024, quando após um trabalho de conclusão de curso de uma faculdade, o grupo, que formou um dos TCCs mais bem avaliados na área de produção de jogos digitais, decidiu manter sua formação para encarar o mercado de trabalho juntos. A equipe do projeto se divide em 11 funcionários principais, que dividem seus cargos em áreas do desenvolvimento de jogos e gamificação, aplicações mobile e confecção de sites e sistemas. As áreas aprofundadas sendo a de modelagem 3D através do Blender, programação em Dart através do uso do framework Flutter, programação em C# com uso da engine Unity, documentação de projetos, Visual Studio, Visual Studio Code e MySql Workbench. De linguagens também são dominadas Javascript, CSS e HTML.',
      corBorda: const Color.fromARGB(255, 137, 54, 122),
      ),

      _criarCardImagem(
      caminhoImagem: 'assets/imagens/logo.jpeg',
      corBorda: const Color.fromARGB(255, 190, 83, 214),
      ),

      _criarCardTexto(
      titulo: 'Identidade Visual',
      texto: 'As cores principais da empresa são os tons de roxo, que indicam aspectos ligados ao luxo, realeza e elite, apresentando o lado mais assertivo e refinado da empresa. Não só isso, as origens do roxo, que vem de uma síntese entre as cores vermelho, que traz a sensação de intensidade, paixão e ambição, e de azul, que carrega consigo uma imagem de profissionalismo e credibilidade. A logo se apresenta em um arranjo simples, com o nome da empresa contido em um retângulo incompleto vindo de uma grande engrenagem, tornando explícito o foco da empresa em fazer coisas funcionais e essenciais, como uma sistema de engrenagens.',
      corBorda: const Color.fromARGB(255, 168, 83, 214),
      ),

      _criarCardTexto(
      titulo: 'Conclusão da Identidade Visual',
      texto: 'Em suma, a identidade visual de Mechanical Bromance com o arranjo de sua logo e cores, escancara uma empresa que através de paixão e confiança em si mesmos produz serviços de alto nível, serviços esse que tem como centro, fazer um elemento funcionar, fazer uma engrenagem rodar.',
      corBorda: const Color.fromARGB(255, 137, 54, 122),
      ),

      _criarCardImagem(
      caminhoImagem: 'assets/imagens/Mascote.jpeg',
      corBorda: const Color.fromARGB(255, 255, 100, 227),
      ),

      _criarCardTexto(
      titulo: 'O Mascote: Brompt',
      texto: 'Já para o mascote, a empresa criou “Brompt”, um robô simpático que se tornaria o sexto integrante da equipe. “Brompt” foi criado pela equipe para trazer uma identidade mais carismática e descontraída para a empresa, reforçando o lado mais cômico da empresa, e também, melhorando seu marketing. Ele é um robô com uma cabeça de televisão e um corpo pequeno, envolvido em um traje formal com um colete laranja com padrões listrados e um capacete também laranja, gerando o retrato de alguém importante em um ambiente de construção civil, como um engenheiro ou mestre de obras. Já a disposição do corpo do mascote tem suas raízes vindas de clichês fofos na cultura popular no mundo todo, como personagens no estilo Chibi ou bonecos Bobble Head.',
      corBorda: const Color.fromARGB(255, 168, 83, 214),
      ),     
      ],
      ),
      ),
      );
      }

      Widget _criarCardTexto({ //mesma estrutura de modelo > dado > construtor porém tudo na mesma página
      required String titulo,
      required String texto,
      required Color corBorda,
      }) {

      return Container(
      width: 800, 
      margin: const EdgeInsets.only(bottom: 24.0),
      padding: const EdgeInsets.all(24.0),
      decoration: BoxDecoration(
      color: const Color.fromARGB(255, 39, 6, 39),
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(color: corBorda, width: 5),
      ),

      child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [

      Text(
      titulo,
      style: const TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      ),
      ),

      const SizedBox(height: 12.0),

      Text(
      texto,
      style: const TextStyle(
      fontSize: 14,
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontFamily: 'Roboto',
      height: 1.5,
      ),
      ),
      ],
      ),
      );
      }

      Widget _criarCardImagem({ //função para cartões de imagem
      required String caminhoImagem,
      required Color corBorda,
      }) {

      return Container(
      width: 500, 
      margin: const EdgeInsets.only(bottom: 24.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
      color: const Color.fromARGB(255, 39, 6, 39),
      borderRadius: BorderRadius.circular(15.0),
      border: Border.all(color: corBorda, width: 5),
      ),

      child: Image.asset(
      caminhoImagem,
      height: 300,
      fit: BoxFit.cover,
      ),
      );
      }
      }