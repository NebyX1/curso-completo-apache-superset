#Antes que nada, debemos instalar el driver de Posgres, llamado "psycopg2"
#pip install psycopg2-binary

#Importamos dependencias
from sqlalchemy import create_engine
import pandas as pd

#Datos de conexión
user = 'postgres'
password = 'password'
host = 'localhost'
database = 'censo2011'

#Crear el engine de SQL Alchemy
engine = create_engine(f"postgresql://{user}:{password}@{host}/{database}") 

#Lee el archivo CSV
df = pd.read_csv("personas.csv")

#Guarda el DataFrame en la tabla 'censo2011' de la base de datos
df.to_sql('personas', con=engine, if_exists='replace', index=False)