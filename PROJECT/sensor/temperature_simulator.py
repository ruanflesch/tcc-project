import paho.mqtt.client as mqtt
import random
import time
import mysql.connector

# Define as credenciais de conexão do banco de dados
db_config = {
    'host': 'db-temperatura.c6gusyh3rn8x.us-east-1.rds.amazonaws.com',
    'user': 'myuser',
    'password': 'mypassword',
    'database': 'temperatura'
}

def save_temperature_to_db(temperature):
    # Conecta ao banco de dados
    conn = mysql.connector.connect(**db_config)
    cursor = conn.cursor()

    # Define a consulta SQL para inserir a temperatura na tabela
    insert_query = "INSERT INTO temperatura_servidor (temperatura, dispositivo, descricao, date_timestamp) VALUES (%s, %s, %s, NOW())"

    # Define os valores para inserção na tabela
    values = (temperature, "dispositivo_exemplo", "descricao_exemplo")

    # Executa a consulta SQL para inserir os dados na tabela
    cursor.execute(insert_query, values)
    conn.commit()

    # Fecha a conexão com o banco de dados
    cursor.close()
    conn.close()

def simulate_temperature():
    client = mqtt.Client()
    client.connect("18.209.61.87", 1883, 60)
    while True:
        temperature = round(random.uniform(16, 46), 2)
        client.publish("temperature", str(temperature))
        save_temperature_to_db(temperature)  # Salva a temperatura no banco de dados
        time.sleep(60)

if __name__ == '__main__':
    simulate_temperature()
