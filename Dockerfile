FROM redmine:3.2.1-passenger

ENV LAST_UPDATE 2015-03-02-10-87


RUN echo 'America/New_York' > /etc/timezone && dpkg-reconfigure -f noninteractive tzdata

RUN apt-get update \
    && apt-get install -y --no-install-recommends git \
    && git clone https://bitbucket.org/lastcall/redmine-external-auth-module.git /usr/src/redmine/plugins/lcm_auth_helper \
    && git clone https://github.com/thorin/redmine_ldap_sync.git /usr/src/redmine/plugins/redmine_ldap_sync \
    && chown redmine:redmine /usr/src/redmine/plugins /usr/src/redmine/public \
    && apt-get purge -y --auto-remove $buildDeps

COPY theme /usr/src/redmine/public/themes/lcm

ADD database.yml /usr/src/redmine/config/database.yml
