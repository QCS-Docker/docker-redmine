FROM redmine:3.2.1-passenger

RUN echo 'America/New_York' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && chown redmine:redmine /usr/src/redmine/plugins /usr/src/redmine/public \

ADD database.yml /usr/src/redmine/config/database.yml
