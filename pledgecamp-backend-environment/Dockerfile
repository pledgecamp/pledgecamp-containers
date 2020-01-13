FROM pledgecamp/python

COPY . /src

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
