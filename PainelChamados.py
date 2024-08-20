# INSIRA O CÓDIGO DO PAINEL ABAIXO (EX. "Painel = 1")


# 👇👇👇👇👇👇👇👇👇👇👇👇👇👇


painel = 3


# 👆👆👆👆👆👆👆👆👆👆👆👆👆👆


# #################################
# #################################
# 
# TABELA DOS CÓDIGOS DAS UNIDADES
# 
# #################################
# #################################


#  29 USF RECANTO DOS BURITIS 1
#  28 USF AGRIPINA LINDOSO
#  27 USF BELO DARDIM 1
#  26 USF IVACIRENE LOURENCO DO CARMO
#  25 USF SAO FRANCISCO
#  24 USF SANTA INES
#  23 URAP AUGUSTO HIDALGO DE LIMA
#  22 USF MARIA DE JESUS
#  20 USF BELO JARDIM III
#  19 USF BENFICA
#  18 USF FRANCISCO EDUARDO DE PAIVA
#  17 CLINICAS UNINORTE BLOCO F
#  16 USF TRIANGULO NOVO
#  15 USF MAXIMO DIOGO
#  14 USF GENTIL PERDOMO DA ROCHA
#  13 URAP VALDEISA VALDEZ
#  12 USF ROSA MARIA
#  11 USF ELPIDIO MOREIRA SOUZA
#  10 USF RAIMUNDO MOREIRA
#   9 URAP MARIA BARROSO
#   8 AMBULATORIO INTEGRADO DE ENSINO
#   7 URAP EDUARDO ASSMAR
#   6 URAP CLAUDIA VITORINO
#   5 USF DEUSIMAR PINHEIRO DA SILVA
#   4 BARRAL Y BARRAL - 2º ANDAR
#   3 URAP RONEY RODRIGUES MEIRELES
#   2 URAP SÃO FRANCISCO
#   1 BARRAL Y BARRAL - 1º ANDAR


# ##########################
# ##########################
# ##########################
# ##########################



# ##########################
# ##########################
# 
# NÃO MEXA NO CÓDIGO ABAIXO
# 
# ##########################
# ##########################



import time
from selenium import webdriver
from webdriver_manager.firefox import GeckoDriverManager
from selenium.webdriver.firefox.service import Service
from selenium.webdriver.firefox.options import Options

# Configurar opções do navegador Firefox
firefox_options = Options()
firefox_options.add_argument("--kiosk")  # Modo kiosk para Firefox

# Inicializar o serviço do GeckoDriver
servico = Service(GeckoDriverManager().install())

# Inicializar o driver do Firefox com as opções configuradas
navegador = webdriver.Firefox(service=servico, options=firefox_options)

# Navegar para a URL desejada
navegador.get("https://riobranco.g-mus.com.br/painel/")

# Inserir valores e clicar no botão
navegador.find_element('xpath', '//*[@id="id"]').send_keys(painel)  # Inserir a numeração do painel em send_keys
navegador.find_element('xpath', '//*[@id="botao"]').click()

input()



