# -*- encoding: utf-8 -*-

from selenium import webdriver
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.common.by import By
from time import sleep
import os

driver = webdriver.Firefox()
driver.get("http://www.cvd.cl/direccion-escolar/")
pes = driver.find_elements(By.XPATH, '//p')
haches = driver.find_elements(By.XPATH, '//h3')


archivo = open('direccion_escolar_contacs.txt', 'w')
for i in range(5):
    archivo.write('{}\t{}\t{}\n'.format(haches[i + 1].text, pes[2 * i + 1].text, pes[2 * i + 2].text))
