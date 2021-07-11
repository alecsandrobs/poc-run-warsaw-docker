# **POC - Executando warsaw dentro de um container docker**

Tentei executar o módulo de segurança bancário dentro de um container docker e não tive sucesso quando iniciado a partir de um docler-compose.
<br> Não sei se a estratégia muda em relação às formas de subir o container e instalar os pacotes, mas segue o que eu fiz...
<br> *Observação: Os testes foram executados em um ambiente linux basedo no Debian (Ubuntu e Linux Mint)*

# Não funciona

**Subir o container pelo docker compose**
```
docker-compose up --build -d
```

**Ocorre o seguinte erro ao executar a instalação do warsaw**
```
Step 5/6 : RUN wget -q https://cfs.gastecnologia.com.br/warsaw/install/warsaw_setup_64.deb &&     dpkg -i warsaw_setup_64.deb
 ---> Running in ab6fec95d38f
Selecting previously unselected package warsaw.
(Reading database ... 54593 files and directories currently installed.)
Preparing to unpack warsaw_setup_64.deb ...
Unpacking warsaw (1.15.3-17) ...
Setting up warsaw (1.15.3-17) ...
System has not been booted with systemd as init system (PID 1). Can't operate.
Failed to connect to bus: Host is down
dpkg: error processing package warsaw (--install):
 installed warsaw package post-installation script subprocess returned error exit status 1
Processing triggers for systemd (245.4-4ubuntu3.7) ...
Errors were encountered while processing:
 warsaw
ERROR: Service 'teste' failed to build: The command '/bin/sh -c wget -q https://cfs.gastecnologia.com.br/warsaw/install/warsaw_setup_64.deb &&     dpkg -i warsaw_setup_64.deb' returned a non-zero code: 1
```

# Funciona

**Subir o container pelo comando**
```
docker run -d --name teste --privileged -v /sys/fs/cgroup:/sys/fs/cgroup:ro jrei/systemd-ubuntu
```

**Acessar o container**
```
docker exec -it teste bash
```

**Instalar pacotes variados**
```
apt-get update && \
apt-get install -y --no-install-recommends \
build-essential \
zlib1g-dev \
libpq-dev \
libgtk-3-0 \
libgtk2.0-0 \
wget \
xdg-utils \
fonts-liberation \
libasound2 \
libcurl3-gnutls \
libcurl3-nss \
libcurl4 \
libdbus-glib-1-2 \
libx11-xcb-dev \
libxt6 \
locales \
tzdata \
ca-certificates \
libnss3-tools \
openssl \
procps \
python-openssl \
python3 \
xauth \
zenity \
ruby-full
```

**Instalar a gem bundler do ruby**
```
gem install --no-document bundler:2.2.6
```

**Baixa e instala o chrome**
```
wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
dpkg -i google-chrome-stable_current_amd64.deb
```

**Baixa e instala o warsaw**
```
wget -q https://cfs.gastecnologia.com.br/warsaw/install/warsaw_setup_64.deb && \
dpkg -i warsaw_setup_64.deb
```

**Verifica a versão do warsaw**
```
dpkg -l warsaw
```

**verifica o status do warsaw**
```
service warsaw status
```
ou
```
systemctl status warsaw
```