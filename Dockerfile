FROM microsoft/dotnet:onbuild
MAINTAINER Baron Chen <baronchen.github.io>

RUN apt-get update; \
    apt-get install -y git curl bzip2; \
    curl -sL https://deb.nodesource.com/setup_0.12 | bash -; \
    curl https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - ; \
    sh -c 'echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'; \
    apt-get update && apt-get install -y google-chrome-stable nodejs Xvfb; \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

ADD xvfb.sh /etc/init.d/xvfb

ENV DISPLAY :99.0
ENV CHROME_BIN /usr/bin/google-chrome


RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y libssl-dev libffi-dev && \
    apt-get install -y python-dev && \
    apt-get install -y build-essential && \
    apt-get clean
    
RUN npm i angular-cli@1.0.0-beta.26 -g
RUN npm i azure-cli -g

