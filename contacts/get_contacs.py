# -*- encoding: utf-8 -*-

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from time import sleep
import os


driver = webdriver.Firefox()


# Educacion Inicial
driver.get("http://www.cvd.cl/educacion-inicial/")

source_code = driver.page_source
list_code = source_code.split('\n')
list_code_clean = [linea.strip() for linea in list_code]

file_output = open('educacion_inicial_contacts.txt', 'w')
for linea in list_code_clean:
        if 'div' in linea:
                list_code_clean.remove(linea)
for l in range(len(list_code_clean)):
    if 'mailto' in list_code_clean[l]:
        persona = list_code_clean[l - 2].split('>')[1].split('<')[0]
        cargo = list_code_clean[l - 1].split('>')[1].split('<')[0]
        mail = list_code_clean[l].split('>')[2].split('<')[0]
        contact = '{}\t{}\t{}\n'.format(persona, cargo, mail)
        file_output.write(contact)
file_output.close()


# Primer Ciclo
driver.get("http://www.cvd.cl/primer-ciclo-basico/")

source_code = driver.page_source
list_code = source_code.split('\n')
list_code_clean = [linea.strip() for linea in list_code]

file_output = open('primer_ciclo_contacts.txt', 'w')
for l in range(len(list_code_clean)):
    if 'mailto' in list_code_clean[l]:
        persona = list_code_clean[l - 4].split('>')[1].split('<')[0]
        cargo = list_code_clean[l - 1].split('>')[1].split('<')[0]
        mail = list_code_clean[l].split('>')[2].split('<')[0]
        contact = '{}\t{}\t{}\n'.format(persona, cargo, mail)
        if not persona or not cargo or not mail:
                break
        file_output.write(contact)
file_output.close()


# Convivencia Escolar
driver.get("http://www.cvd.cl/convivencia-escolar/")

source_code = driver.page_source
list_code = source_code.split('\n')
list_code_clean = [linea.strip() for linea in list_code]

file_output = open('convivencia_escolar_contacts.txt', 'w')
for l in range(len(list_code_clean)):
    if 'staff-detail.html' in list_code_clean[l]:
        persona = list_code_clean[l].split('>')[2].split('<')[0]
        cargo = list_code_clean[l + 1].split('>')[2].split('<')[0]
        mail = list_code_clean[l + 2].split('>')[2].split('<')[0]
        contact = '{}\t{}\t{}\n'.format(persona, cargo, mail)
        file_output.write(contact)
file_output.close()