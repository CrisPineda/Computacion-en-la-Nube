# Imagen base con CUDA para GPU
FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# Instala Miniconda con Python 3.10
ENV PATH="/root/miniconda3/bin:${PATH}"
RUN apt-get update && \
    apt-get install -y wget bzip2 && \
    rm -rf /var/lib/apt/lists/* && \
    wget https://repo.anaconda.com/miniconda/Miniconda3-py310_23.3.1-0-Linux-x86_64.sh -O /tmp/miniconda.sh && \
    bash /tmp/miniconda.sh -b -p /root/miniconda3 && \
    rm /tmp/miniconda.sh

# Establece directorio de trabajo
WORKDIR /app

# Copia los archivos del proyecto
COPY . /app

# Instala compiladores y librerías necesarias para NumPy/MXNet
RUN apt-get update && \
    apt-get install -y build-essential gfortran libopenblas-dev liblapack-dev && \
    rm -rf /var/lib/apt/lists/*

# Instala dependencias Python desde requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expone el puerto que usará Flask
EXPOSE 5000

# Comando por defecto para ejecutar la aplicación
CMD ["python", "app.py"]
