FROM node:boron

MAINTAINER Travis N. Thomsen <cablesandwires@gmail.com>

EXPOSE 3000

ARG NODE_ENV=production

RUN  apt-get -yq update && apt-get install -qqy wget git vim

RUN mkdir -p /var/node
RUN cd /var/node && git clone https://github.com/rivethead42/node-xterm.git xterm
WORKDIR /var/node/xterm

RUN npm install bower -g && npm install && bower install --allow-root
RUN groupadd nodejs
RUN useradd -g nodejs nodejs
RUN chown -R nodejs:nodejs /var/node/xterm

ENV NODE_ENV ${NODE_ENV}

CMD ["node", "/var/node/xterm/app.js"]
