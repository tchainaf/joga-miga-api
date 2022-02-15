# README

Este projeto é o backend do aplicativo do projeto [JogaMiga](https://www.jogamiga.com.br).

## Requisitos para desenvolvimento/deploy
  * [Ruby](https://www.ruby-lang.org/en/) versão >= 2.6.3
  * [PostgreSQL](https://www.postgresql.org/) versão >= 9.1
  * [RVM](https://rvm.io/) é recomendado

### Instalando PostgreSQL

```bash
sudo apt-get install postgresql postgresql-contrib
```

Configurar no arquivo pg_hba.conf o modo de login com senha.

```bash
sudo nano /etc/postgresql/XX/main/pg_hba.conf
#Database administrative login by Unix domain socket
local   all             postgres                                peer
local   all             jogamiga                                password
```

Conferir no arquivo postgresql.conf a porta configurada, o padrão é 5432.
```bash
sudo nano /etc/postgresql/XX/main/postgresql.conf
port = 5432
```

Ao final das configurações, restartar o serviço do PostgreSQL:
```bash
sudo systemctl restart postgresql
```

### Instalando RVM e ruby

Siga os passos indicados no [RVM][https://rvm.io/rvm/install] para instalar o RVM.
Após isso, instale a versão do ruby que deseja utilizar:

```bash
rvm install 2.6.3
rvm use 2.6.3 --default
```

## Configurando o ambiente de desenvolvimento

Clonar o repositório do projeto:
```bash
git clone https://github.com/tchainaf/joga-miga-api.git
```

Instalar dependências:
```bash
cd joga-miga-api
bundle install
```

Configurar informações do banco de dados no arquivo `config/database.yml`.
Executar setup e migrações do banco de dados:
```bash
bundle exec rake db:setup
bundle exec rake db:migrate
```

Subir o servidor localmente:
```bash
bundle exec rails s
```

## Configurando variáveis para deploy
#TODO

## Outros comandos

Para editar as credenciais:
```bash
EDITOR="vim" bundle exec rails credentials:edit
```

Para executar o modo console:
```bash
bundle exec rails c
```