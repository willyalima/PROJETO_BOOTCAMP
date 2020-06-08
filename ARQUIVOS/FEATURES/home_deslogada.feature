# language: pt
@AMBIENTE
Funcionalidade: Home deslogada

  Contexto:
    Dado que estou na home deslogada


  @STATUS @TAGDOJIRA @PLATAFORMA @TAGDOTIME
  Cenário: Direcionamento para login ao tentar acessar fatura através do Card
   Quando solicito acessar Fatura por cards
   Então devo ser direcionado para área de login 

  @STATUS @TAGDOJIRA @PLATAFORMA @TAGDOTIME
  Cenário: Direcionamento para login ao tentar acessar "Imagem e Sinal" através do Card
    Quando solicito acessar soluções de Imagem e Sinal
    Então devo ser direcionado para área de login

  @STATUS @TAGDOJIRA @PLATAFORMA @TAGDOTIME
  Cenário: Direcionamento para login ao tentar assinar um Opcional através do Card
    Quando tento acessar um Opcional por Cards
    Então devo ser direcionado para área de login

  @STATUS @TAGDOJIRA @PLATAFORMA @TAGDOTIME
  Cenário: Execução de trailer de PPV deslogado
    Dado que estou na área de Compras
    E acesso os detalhes de um PPV qualquer
    Quando acesso o trailer
    Então o trailer deve ser executado

  @STATUS @TAGDOJIRA @PLATAFORMA @TAGDOTIME
  Cenário: Direcionamento para login ao tentar fazer UP em um card deslogado
    Quando solicito dar UP em um card
    Então devo ser direcionado para área de login

  @STATUS @TAGDOJIRA @PLATAFORMA @TAGDOTIME
  Cenário: Direcionamento para login ao tentar dar like em um card deslogado
    Quando solicito dar like em um card
    Então devo ser direcionado para área de login

  @STATUS @TAGDOJIRA @PLATAFORMA @TAGDOTIME
  Cenário: Compartilhamento de conteúdo de card
    Quando solicito compartilhar conteudo do card
    Então devo receber as opções de canais de compartilhamento

