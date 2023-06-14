#! Antes que nada, debemos instalar la biblioteca "pyreadstat" para poder convertir de archivos SPSS a csv con pandas
#vpip install pyreadstat

import pandas as pd
import pyreadstat

#Cargamos el archivo en formato SPSS y lo guardamos en un dataframe
df, meta = pyreadstat.read_sav("personas.sav")

#!Esta fila es opcional, seleccionamos 40000 filas al azar para achicar nuestro dataframe para pruebas
df = df.sample(n=70000)

#Exportamos el dataframe a un archivo CSV
df.to_csv("personas.csv", index=False, encoding="utf-8")

#Esto es opcional, en caso de que solo quieras usar algunas columnas y no todas
# df[["column_a", "column_b"]].to_csv("output_file.csv", index=False)