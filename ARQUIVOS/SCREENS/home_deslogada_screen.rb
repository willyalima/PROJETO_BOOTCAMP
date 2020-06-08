class HomeDeslogadaScreen < BaseScreen
  include HomeModule

  identificator(:trait) { 'contentmain' }
  identificator(:my_APP_area) { 'navigation_my_APP' }
  identificator(:btn_like) { [:accessibility_id, 'Botão like não selecionado'] }
  identificator(:btn_dislike) { [:accessibility_id, 'Botão like selecionado']  }
  identificator(:btn_pinar) { 'engagement_pin' }
  identificator(:navigation_home) { 'navigation_home' }
  identificator(:alerta) { 'br.com.APP.selfcare.dev:id/alertTitle' }
  identificator(:cpf_login) { 'br.com.APP.selfcare.dev:id/APPCustomEditText' }
  identificator(:btn_voltar) { 'abc_action_bar_up_description' }
  identificator(:btn_pin) { 'btnPin' }
  identificator(:ops_msg_logar) { 'android:id/button1' }
  identificator(:ops_msg_cancelar) { 'android:id/button2' }
  identificator(:btn_term_back) { [:accessibility_id, 'Navegar para cima'] }
  identificator(:txt_termo_uso) { [:uiautomator, 'new UiSelector().textContains("TERMO DE USO")'] }
  identificator(:recarregar) { [:uiautomator, 'new UiSelector().textContains("Recarregar")'] }

  # menu
  identificator(:inicio_menu) { [:xpath, '//XCUIElementTypeOther[@name="home_pager"]/XCUIElementTypeTable/XCUIElementTypeCell[29]/XCUIElementTypeTable'] }
  identificator(:navigation_shopping) { [:uiautomator, 'new UiSelector().textContains("Loja")'] }

  # quiz
  identificator(:btn_quiz_proximo) { [:id, 'button_next'] }
  identificator(:btn_quiz_dia_do_rock) { [:class, 'android.view.ViewGroup', 1] }
  identificator(:btn_quiz_opcao_um) { 'name' }
  identificator(:btn_quiz_jogar_novamente) { [:uiautomator, 'new UiSelector().textContains("Jogar novamente")'] }
  identificator(:btn_quiz_ok) { [:uiautomator, 'new UiSelector().textContains("OK")'] }
  identificator(:btn_quiz_facil) { [:class, 'android.view.ViewGroup', 0] }

  # splash
  identificator(:card_promo) { 'button_advertisement_dismiss' }
  identificator(:btn_invoice) { [:uiautomator, 'new UiSelector().textContains("Melhor forma")'] }
  identificator(:btn_acesse) { [:uiautomator, 'new UiSelector().textContains("ACESSE")'] }
  identificator(:btn_image_sign) { [:uiautomator, 'new UiSelector().textContains("ACESSAR")'] }
  identificator(:btn_optional) { [:uiautomator, 'new UiSelector().textContains("ASSINE AGORA")'] }
  identificator(:list_name) { [:uiautomator, 'new UiSelector().textStartsWith("trocar")'] }
  identificator(:recarregar) { [:uiautomator, 'new UiSelector().textContains("Recarregar")'] }
  identificator(:btn_img_sinal) { [:uiautomator, 'new UiSelector().textContains("IMAGEM E SINAL")'] }
  identificator(:btn_fatura) { [:uiautomator, 'new UiSelector().textContains("@ITRGR-322")'] }
  identificator(:txt_card_fatura) { [:uiautomator, 'new UiSelector().textContains("Seu card de fatura é aqui")'] }
  identificator(:txt_card_imgsinal) { [:uiautomator, 'new UiSelector().textContains("Envie o sinal por aqui")'] }


  identificator(:template_folha) { 'textAction1' }
  identificator(:share_options) { 'engagement_share' }
  identificator(:btn_share) { 'btn_share' }
  identificator(:ops_msg_cancelar) { 'android:id/button2' }
  identificator(:dislike_ativado) { 'ic_dislike_filled' }
  identificator(:dislike_neutro) { 'ic_dislike' }
  identificator(:btn_confirm_pin) { 'android:id/button1' }
  identificator(:txt_login) { 'editText' }
  identificator(:btn_comprar_ppv) { [:uiautomator, 'new UiSelector().textContains("ALUGUE AGORA")'] }
  identificator(:btn_alugar_por) { 'bt_rent' }
  identificator(:btn_assinar) { [:uiautomator, 'new UiSelector().textContains("ASSINAR")'] }
  identificator(:btn_entrar) { 'bt_enter' }
  identificator(:txt_falta_pouco) { [:uiautomator, 'new UiSelector().textContains("Falta apenas um passo!")'] }

  # qualquer elemento da tela
  identificator(:clicavel) { [:uiautomator, 'new UiSelector().clickable(true)'] }
  identificator(:btn_continuar_mEU_APP) { [:uiautomator, 'new UiSelector().textStartsWith("CONTINUAR PARA MEU APP")'] }

  # rubocop:disable Metrics/LineLength
  def check_share_options
    i = 1
    num = 3
    while i <= num
      objeto = wait { find_element(:xpath, "/hierarchy/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.FrameLayout/android.widget.ListView/android.widget.TextView[#{i}]") }
      objetotxt = objeto.attribute('text')
      puts objetotxt
      i += 1
    end
  end
  # rubocop:enable Metrics/LineLength

  def tap_btn_pinar
    swipe_to_element btn_pinar, 'fast'
    touch_btn_pinar
    touch_btn_confirm_pin
  end

  def tap_btn_like
    swipe_to_element btn_like, 'fast'
    touch_btn_like
    touch_btn_confirm_pin
  end

  def tap_btn_dislike
    swipe_to_element btn_dislike, 'fast'
    touch_btn_dislike
    touch_btn_confirm_pin
  end

  def tap_btn_share
    swipe_to_element btn_share, 'fast'
    touch_btn_share
    check_share_options
  end

  def swipe_up_to_btn_image_sign
    swipe_to_element btn_image_sign, 'fast', 35
  end
end
