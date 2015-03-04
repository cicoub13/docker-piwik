FROM tutum/apache-php

RUN apt-get update
RUN apt-get install -yq unzip php5-curl php5-gd php5-cli php5-geoip 
RUN rm -rf /app/*
RUN curl -L -O http://builds.piwik.org/piwik.zip && \
    unzip piwik.zip && \
    mv piwik/* . && \
    mv piwik/.* . && \
    rm -rf piwik && \
    rm piwik.zip && \
    mkdir tmp
RUN chmod a+w /app/tmp/ && \
    chmod a+w /app/config

EXPOSE 80
VOLUME /app/config
CMD ["/run.sh"]
