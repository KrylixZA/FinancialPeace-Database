FROM mariadb:latest as db

RUN apt-get update; \
    apt-get install -y wget apt-transport-https software-properties-common; \
    wget -q https://packages.microsoft.com/config/ubuntu/20.04/packages-microsoft-prod.deb; \
    dpkg -i packages-microsoft-prod.deb; \
    apt-get update; \
    add-apt-repository universe; \
    apt-get install -y powershell;

WORKDIR /docker-entrypoint-initdb.d
COPY /src/Freedom/Freedom.CreateSchema.sql .
COPY /src/Freedom/Security/Users/sa.sql .
COPY /src/Freedom/Security/Users/FinancialPeace.sql .
WORKDIR /

WORKDIR /initdb
COPY /build .
COPY /src/Freedom ./Freedom