FROM python:3.10

WORKDIR /app

# Instala dependências do sistema
RUN apt-get update && apt-get install -y \
    git \
    ffmpeg \
    libgl1 \
    libglib2.0-0

# Clona o repositório (ou copie os arquivos já presentes no fork)
COPY . .

# Instala dependências Python
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

# Expõe a porta padrão
EXPOSE 8188

# Inicia o ComfyUI
CMD ["python", "main.py", "--listen", "0.0.0.0"]
