FROM pledgecamp/python

ENV DEBIAN_FRONTEND=noninteractive

RUN \
  mkdir -p /pledgecamp \
  && apt-get update \
  && apt-get install -y software-properties-common wget \
  && add-apt-repository universe \
  && wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add - \
  && RELEASE=$(lsb_release -cs) \
  && echo "deb http://apt.postgresql.org/pub/repos/apt/ ${RELEASE}"-pgdg main | tee  /etc/apt/sources.list.d/pgdg.list \
  && apt-get update \
  && apt-get install -y \
    curl \
    postgresql-11 \
    postgresql-client \
    redis-server \
    supervisor \
  && echo "host    all             pledgecamp      0.0.0.0/0               md5" >> /etc/postgresql/11/main/pg_hba.conf

# Setup PostgreSQL
USER postgres
RUN \
    /etc/init.d/postgresql start \
    && psql -c "CREATE USER pledgecamp WITH SUPERUSER PASSWORD 'dev';" \
    && createdb -O pledgecamp pledgecamp \
    && psql -d pledgecamp -c 'create extension ltree;'

# Install the Python environment
USER root
WORKDIR /src

COPY redis.conf /pledgecamp/redis.conf
COPY supervisor.conf /pledgecamp/supervisor.conf
COPY start.sh /pledgecamp/start.sh
COPY postgres_wait.sh /pledgecamp/postgres_wait.sh
COPY api_wait.sh /pledgecamp/api_wait.sh

# Postgresql
EXPOSE 5432
# Redis
EXPOSE 6379
# Flask
EXPOSE 5000

CMD ["/usr/bin/supervisord", "-c", "/pledgecamp/supervisor.conf", "--nodaemon"]
