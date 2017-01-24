FROM microsoft/dotnet:onbuild
MAINTAINER Baron Chen <baronchen.github.io>

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y libssl-dev libffi-dev && \
    apt-get install -y python-dev && \
    apt-get install -y build-essential && \
    apt-get clean
    

RUN npm i angular-cli@1.0.0-beta.26 -g
RUN npm i azure-cli -g
RUN npm install phantomjs -g

