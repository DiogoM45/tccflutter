# Ultimate Clinic Simulator para Pomo de Eris- Aplicação Web/Mobile

Este repositório armazena o código-fonte da aplicação de apresentação e documentação do projeto de gamificação "Ultimate Clinic Simulator", desenvolvido pela empresa Mechanical Bromance. O sistema foi construído utilizando o framework Flutter e a linguagem Dart, com foco em execução multiplataforma (com otimização para Web). A aplicação mobile assim como jogo é uma divulgação para a empresa cliente Pomo de Eris.

---

## 1. O que é a Aplicação

A presente aplicação consiste em um portal interativo que atua como uma extensão do jogo principal (desenvolvido na engine Unity). Seu objetivo é fornecer aos usuários e avaliadores uma visão detalhada dos bastidores do projeto.

A aplicação centraliza informações essenciais em diferentes seções, permitindo a exploração de:
*   **Galeria:** Catálogo de imagens divididas entre modelos 3D de personagens, capturas de tela dos minigames e interfaces do jogo.
*   **O Jogo:** Detalhamento das mecânicas, história e minigames da Unity, dividido em abas dinâmicas.
*   **Curiosidades e Empresa:** Contextualização da lore do jogo e apresentação institucional da desenvolvedora.
*   **Créditos:** Identificação e atribuição de funções para todos os membros da equipe de desenvolvimento.
*   **Trailer:** Player de vídeo integrado para exibição do trailer oficial do jogo.

## 2. Como Interagir com a Aplicação

A interface foi projetada para ser intuitiva e responsiva, adaptando-se a diferentes tamanhos de tela (computadores, tablets e smartphones). A interação ocorre das seguintes formas:

*   **Navegação Principal:** O acesso às telas é feito por meio de um menu lateral dinâmico, acionado pelo botão de menu (ícone de três linhas). O menu sobrepõe o conteúdo atual com um fundo escurecido para facilitar a leitura e pode ser fechado ao clicar fora dele ou no botão "X".
*   **Filtros de Conteúdo:** Páginas como a Galeria e a seção do Jogo utilizam botões de seleção (Choice Chips). Ao clicar nestes botões, o conteúdo é filtrado instantaneamente na tela, sem a necessidade de recarregar a página.
*   **Rolagem:** Todas as telas possuem barras de rolagem verticais para acomodar conteúdos extensos, como a lista de curiosidades e a página da empresa.
*   **Interação com Mídia:** Na página de Trailer, o usuário pode interagir diretamente com o player do YouTube incorporado (reproduzir, pausar, ajustar volume e alternar para tela cheia).

## 3. Como Acessar

Por ter sido construída em Flutter Web, a aplicação não exige a instalação de arquivos executáveis (APK ou EXE) para ser visualizada em computadores. O acesso é realizado diretamente pelo navegador de internet.

1.  Certifique-se de estar utilizando um navegador atualizado (Google Chrome, Microsoft Edge, Firefox, etc.).
2.  Acesse o link de deploy da aplicação: **[INSERIR O LINK DO SEU DEPLOY AQUI, ex: GitHub Pages, Firebase Hosting, Vercel]**.
3.  A aplicação carregará automaticamente e estará pronta para uso.

*(Nota: Para rodar o projeto localmente em modo de desenvolvimento, é necessário ter o Flutter SDK instalado e executar o comando `flutter run -d chrome` na raiz do projeto).*


| **Botão do Menu** | Detalhe do botão flutuante (hambúrguer) que aciona a abertura do menu lateral. | <img src="URL_DA_IMAGEM_8" width="250" alt="Botão Hambúrguer"> |
| **Trailer** | Integração nativa de iframe para reprodução do vídeo de apresentação do jogo via YouTube. | <img src="URL_DA_IMAGEM_9" width="250" alt="Página de Trailer"> |
