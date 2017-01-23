FROM microsoft/dotnet
MAINTAINER Baron Chen <baronchen.github.io>

ARG CHROME_VERSION="google-chrome-stable"
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - \
  && echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list \
  && apt-get update -qqy \
  && apt-get -qqy install \
    ${CHROME_VERSION:-google-chrome-stable} \
  && rm /etc/apt/sources.list.d/google-chrome.list \
  && rm -rf /var/lib/apt/lists/* /var/cache/apt/*

RUN curl -sL https://deb.nodesource.com/setup_6.x | bash - && \
    apt-get install -y nodejs && \
    apt-get install -y libssl-dev libffi-dev && \
    apt-get install -y python-dev && \
    apt-get install -y build-essential && \
    apt-get clean
    
RUN npm i angular-cli -g --no-optional
RUN npm i azure-cli -g --no-optional

