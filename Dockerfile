FROM node:6.10.1

ENV YARN_VERSION 0.21.3

RUN set -ex \
 && for key in \
   6A010C5166006599AA17F08146C2130DFD2497F5 \
 ; do \
   gpg --keyserver ha.pool.sks-keyservers.net --recv-keys "$key"; \
 done \
 && curl -fsL -o yarn.js "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-legacy-$YARN_VERSION.js" \
 && curl -fsL -o yarn.js.asc "https://yarnpkg.com/downloads/$YARN_VERSION/yarn-legacy-$YARN_VERSION.js.asc" \
 && gpg --batch --verify yarn.js.asc yarn.js \
 && rm yarn.js.asc \
 && mv yarn.js /usr/local/bin/yarn \
 && chmod +x /usr/local/bin/yarn \
 && mkdir -p /usr/src/app

VOLUME [ "/root/.cache", "/usr/src/app" ]

WORKDIR /usr/src/app
