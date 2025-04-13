FROM python:3.10

# Diretório de trabalho
WORKDIR /app

# Dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libgl1 \
    libglib2.0-0

# Copia os arquivos
COPY . .

# Cria diretórios necessários
RUN mkdir -p input output

# Instala dependências Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expor porta
EXPOSE 8188

# Comando de inicialização com log
CMD ["bash", "-c", "ls -la && echo 'Iniciando ComfyUI...' && python main.py --listen 0.0.0.0"]
