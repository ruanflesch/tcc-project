# Use a imagem oficial do Python 3.8
FROM python:3.8

# Copie os arquivos necessários para o diretório de trabalho
COPY . /home/vm2/Documentos/PROJECT/sensor

# Defina o diretório de trabalho
WORKDIR /home/vm2/Documentos/PROJECT/sensor

# Instale as bibliotecas necessárias
RUN pip install paho-mqtt mysql-connector-python

# Exponha a porta MQTT
EXPOSE 1883

# Execute o aplicativo
CMD ["python", "sensor1.py"]
