Dado(/^que estou na home deslogada$/) do
  home = HomeScreen.new
  home.handle_banner
end

######### DADO #########

Dado('que informo o CPF {string}') do |string|
  home = HomeDeslogadaScreen.new
  home.touch_my_sky_area
  APP = MEUAPPScreen.new
  APP.touch_change_signature_buttton
  auth = AutenticadorScreen.new
  auth.enter string, auth.cpf_field
  auth.touch_btn_enter
  home.handle_allow_gps if home.is_ios?
end

Dado(/^que estou na área de login$/) do
  home = HomeScreen.new
  home.handle_banner
  des = HomeDeslogadaScreen.new
  des.touch_my_APP_area
  APP = MinhaAPPScreen.new
  APP.check_trait
  APP.touch_btn_sign_in
end

Quando(/^acesso "([^"]*)" no menu 'Minha APP'$/) do |menu|
  APP = MinhaAPPScreen.new
  home = HomeScreen.new
  home.handle_banner
  home.touch_my_APP_area
  APP.acessa_menu menu
end

######### ENTAO #########

Dado('acesso ainda não possuo APP') do
  @page = AutenticadorScreen.new
  @page.check_trait
  @page.touch_dont_have_APP
end

E('acesso os detalhes de um PPV qualquer') do
  compras = ComprasScreen.new
  compras.swipe_up_to_carrossel_filmes
  compras.carrossel_filmes_displayed?
  compras.touch_carrossel_filmes
end

Dado(/^avalio o APP como 'Incrível'$/) do
  avalie = AvaliarAppScreen.new
  sleep 3
  avalie.touch_rb_incrivel
  2.times do
    avalie.swipe_screen 'fast'
    avalie.touch_button
  end
  # avalie.touch_btn_proximo
end

Quando(/^solicito dar like em um card$/) do
  home = HomeDeslogadaScreen.new
  home.tap_btn_like
end

Quando('solicito acessar soluções de Imagem e Sinal') do
  home = HomeDeslogadaScreen.new
  home.swipe_to_element home.txt_card_imgsinal, 'fast', 35
  home.swipe_to_element home.btn_img_sinal
  home.touch_btn_img_sinal
end

Dado('acesso o menu Minha SKY') do
  home = HomeDeslogadaScreen.new
  home.touch_my_APP_area
end

Dado('que estou na área de Compras') do
  compras = HomeDeslogadaScreen.new
  home = HomeScreen.new
  home.handle_banner
  compras.touch_navigation_shopping
end

######### QUANDO #########

Quando('não apresentar o controle remoto') do
  @page = ControleRemotoScreen.new
  @page.existe_txt_controle_remoto
end

Quando('solicito assinar um PPV por Cards') do
  home = HomeDeslogadaScreen.new
  home.swipe_to_element home.btn_assinar, 'fast', 35
  home.touch_btn_assinar
end

Quando(/^solicito acessar Fatura por cards$/) do
  home = HomeDeslogadaScreen.new
  home.swipe_to_element home.txt_card_fatura, 'fast', 35
  home.touch_btn_fatura
end

Quando(/^tento acessar um Opcional por Cards$/) do
  home = HomeDeslogadaScreen.new
  home.swipe_to_element home.btn_optional, 'fast', 35
  home.touch_btn_optional
  home.touch_btn_assinar
end

Quando(/^avalio a Sky com nota (\d+)$/) do |arg1|
  avalie = AvaliarSkyScreen.new
  avalie.swipe_up_to_nota_sky
  avalie.enter arg1, avalie.nota_sky
  sleep 5
  hide_keyboard
  avalie.choose_reason
  avalie.touch_btn_proximo
end

Quando(/^solicito compartilhar conteudo do card$/) do
  home = HomeDeslogadaScreen.new
  home.tap_btn_share
end

######### E #########
Quando(/^solicito dar UP em um card$/) do
  home = HomeDeslogadaScreen.new
  home.tap_btn_pinar
end

######### ENTAO #########
Então('devo receber comunicação de CPF não encontrado no sistema') do
  auth = AutenticadorScreen.new
  auth.tv_cpf_invalido_displayed?
end

Então('devo receber comunicação de CPF inválido') do
  @page = AutenticadorScreen.new
  @page.tv_cpf_invalido_displayed?
end

Então('devo ser direcionado para área do PPV') do
  @page = HomeDeslogadaScreen.new
  @page.touch_btn_alugar_por
  @page = AutenticadorScreen.new
  @page.cpf_field_displayed?
end

Então('sou direcionado para exibição dos termos de uso do App') do
  @page = HomeDeslogadaScreen.new
  @page.txt_termo_uso_displayed?
end

Então('ao "Fechar"') do
  @page = MinhaAPPScreen.new
  @page.touch_btn_term_back
end

Então('devo ser direcionado para o menu Minha APP') do
  @page = MinhaAPPScreen.new
  @page.scroll_up
  @page.check_trait
end


Então('o trailer deve ser executado') do
  compras = ComprasScreen.new
  compras.video_screen_touch
end

Então('devo ser direcionado para o site {string}') do |string|
  APP = APPEmpresasScreen.new
  APP.validate_url(string)
end

Então(/^devo ser direcionado para a area de Controle Remoto$/) do
  control = ControleRemotoScreen.new
  control.txt_titulo_displayed?
end

Então(/^devo ser direcionado para área de login$/) do
  home = AutenticadorScreen.new
  home.cpf_field_titular_displayed?
end

Então(/^devo receber as opções de canais de compartilhamento$/) do
  home = HomeDeslogadaScreen.new
  home.check_share_options
end

Então(/^devo receber mensagem de agradecimento - Avaliacao Sky$/) do
  avalie = AvaliarSkyScreen.new
  avalie.validate_agradecimento_msg
end

Então(/^devo ser direcionado para área do formulário de Banda Larga$/) do
  bl = BandaLargaScreen.new
  bl.element_displayed? bl.txt_choose_plan, 60
end

# rubocop:disable Metrics/ParameterLists
Então('devo visualizar opções {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string}, {string} e {string}') do |string, string2, string3, string4, string5, string6, string7, string8, string9, string10, string11, string12, string13|
  @page = MinhaAPPScreen.new
  @page.validate_menu string
  @page.validate_menu string2
  @page.validate_menu string3
  @page.validate_menu string4
  @page.validate_menu string5
  @page.validate_menu string6
  @page.validate_menu string7
  @page.validate_menu string8
  @page.validate_menu string9
  @page.validate_menu string10
  @page.validate_menu string11
  @page.validate_menu string12
  @page.validate_menu string13
end

Então('as opções de {string}, {string}, {string}, {string}, {string}, {string} e {string} devem estar inabilitadas') do |string, string2, string3, string4, string5, string6, string7|
  @page = MinhaAPPScreen.new
  @page.scroll_up
  @page.acessa_menu string
  @page.trait
  @page.acessa_menu string2
  @page.trait
  @page.acessa_menu string3
  @page.trait
  @page.acessa_menu string4
  @page.trait
  @page.acessa_menu string5
  @page.trait
  @page.acessa_menu string6
  @page.trait
  @page.acessa_menu string7
  @page.trait
end
# rubocop:enable Metrics/ParameterLists



Então('sou direcionado para formulário de avaliação da SKY') do
  avalie = AvaliarAPPScreen.new
  avalie.check_trait
end

Então('avalio o app') do
  formavaliar = AvaliarAPPScreen.new
  formavaliar.check_trait
  formavaliar.touch_rd_option_yes
  formavaliar.touch_btn_proximo
  formavaliar.touch_btn_concluido
end

Então('não deve ser apresentado o botão de {string}') do |string|
  compras = ComprasScreen.new
  compras.element_not_present? string
end

Quando('seleciono um Opcional na área de Compras') do
  compras = ComprasScreen.new
  compras.swipe_up_to_banner_ppv_logado
  compras.touch_banner_ppv_logado
end

E('acesso Assinar') do
  compras = ComprasScreen.new
  compras.btn_assinar_displayed?
  sleep 2
  compras.touch_btn_assinar
end

Quando("avalio o APP como 'Não curti.'") do
  avaliacao = AvaliarAppScreen.new
  avaliacao.touch_rb_one_star
  avaliacao.touch_btn_proximo
  form = AvaliarAppScreen.new
  form.check_trait
end

Quando('avalio o APP como Gostei, mas poderia melhorar') do
  avaliacao = AvaliarAppScreen.new
  avaliacao.touch_rb_four_stars
  avaliacao.touch_btn_proximo
  form = AvaliarAppScreen.new
  form.check_trait
end

Quando('preencher o formulario - Avaliacao App') do
  form = AvaliarAppScreen.new

  arg1 = 'Experiencia'
  arg2 = 'Nome'
  arg3 = '8199879999'
  arg4 = 'testeemail@gmail.com'

  form.enter arg1, form.experience_field
  form.hide_keyboard
  form.enter arg2, form.name_field
  form.hide_keyboard
  form.enter arg3, form.phone_field
  form.hide_keyboard
  form.enter arg4, form.email_field
  form.hide_keyboard
end

Então('devo receber mensagem de agradecimento - Avaliacao App') do
  form = AvaliarAppScreen.new
  form.txt_agradecimento_displayed?
  form.touch_btn_concluido
  form.validate_empty_screen
end

Então('devo ser direcionadom para área de avaliacao do App') do
  form = AvaliarAppScreen.new
  form.validate_empty_screen
end

Quando('acesso Alugar') do
  compras = ComprasScreen.new
  compras.touch_btn_alugar
end

Então(/^sou direcionado para informar detalhes da insatisfação$/) do
  avalie = AvaliarAPPScreen.new
  avalie.msg_triste_displayed?
  avalie.touch_btn_completed
end

Quando('faço algum quiz no nivel Fácil') do
  home = HomeDeslogadaScreen.new
  home.touch_btn_quiz_dia_do_rock
  home.txt_selecione_dificuldade_displayed? if home.is_ios?
  home.touch_btn_quiz_facil
  home.execute_easy_quiz
end

Então('devo visualizar os botões de Jogar novamente') do
  home = HomeDeslogadaScreen.new
  home.btn_quiz_jogar_novamente_displayed?
end

Então('visualizo o menu {string}') do |string|
  menu = MinhaAPPScreen.new
  menu.validate_menu string
end

Então('devo receber mensagem de confirmação') do
  home = HomeDeslogadaScreen.new
  home.txt_falta_pouco_displayed?
end

Então('ao confirmar o popup') do
  home = HomeDeslogadaScreen.new
  home.alert_accept
end

Quando('acesso o trailer') do
  compras = ComprasScreen.new
  compras.lk_trailer_displayed?
  compras.touch_lk_trailer
end
