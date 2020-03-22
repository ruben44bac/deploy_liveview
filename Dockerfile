FROM elixir:1.9.1 as builder

ENV MIX_ENV=prod

RUN apt install curl \
  && curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && apt-get install -y nodejs \
  && apt-get install -y npm

RUN mix local.hex --force \
  && mix local.rebar --force

ADD . .

RUN mix deps.get --only prod \
  && cd apps/tester_web/assets \
  && npm install \
  && npm run deploy --prefix \
  && cd .. \
  && cd .. \
  && cd ..\
  && mix phx.digest \
  && mix distillery.release --name=tester --env=$MIX_ENV

## STAGE 2: Release ##

FROM elixir:1.9.1-slim

MAINTAINER Ruben Baeza (ruben.baeza@santiago.mx)

ENV REPLACE_OS_VARS=true \
  PORT=${PORT} \
  NODE_IP=${NODE_IP} \
  HOST_IP=${HOST_IP} \
  NODE_COOKIE=${NODE_COOKIE}

EXPOSE ${PORT}

COPY --from=builder /_build /_build

CMD ["_build/prod/rel/tester/bin/tester", "foreground"]