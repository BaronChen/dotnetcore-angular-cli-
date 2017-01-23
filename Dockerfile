FROM microsoft/dotnet
MAINTAINER Baron Chen <baronchen.github.io>

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y google-chrome-stable && \
    apt-get install -y libssl-dev libffi-dev && \
    apt-get install -y python-dev && \
    apt-get install -y build-essential && \
    npm i -g angular-cli && \
    npm i -g bower && \
    apt-get clean
