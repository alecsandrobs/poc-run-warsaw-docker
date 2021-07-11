FROM jrei/systemd-ubuntu

RUN apt-get update && \
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

RUN gem install --no-document bundler:2.2.6

RUN wget -q https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb && \
    dpkg -i google-chrome-stable_current_amd64.deb

RUN wget -q https://cfs.gastecnologia.com.br/warsaw/install/warsaw_setup_64.deb && \
    dpkg -i warsaw_setup_64.deb

COPY teste.sh teste.sh