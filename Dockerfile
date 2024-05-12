FROM postgres:alpine

ENV DOPPLER_TOKEN=$DOPPLER_TOKEN
ENV POSTGRES_PASSWORD=$POSTGRES_PASSWORD
ENV FOO=$FOO

RUN wget -q -t3 'https://packages.doppler.com/public/cli/rsa.8004D9FF50437357.key' -O /etc/apk/keys/cli@doppler-8004D9FF50437357.rsa.pub && \
    echo 'https://packages.doppler.com/public/cli/alpine/any-version/main' | tee -a /etc/apk/repositories && \
    apk add doppler

RUN doppler configure set token $DOPPLER_TOKEN

RUN echo "$FOO | \$DOPPLER_TOKEN | $DOPPLER_TOKEN | DOPPLER_TOKEN"
# RUN doppler run --command="echo \$DOPPLER_TOKEN"
RUN doppler run --command="echo \$POSTGRES_PASSWORD"
# RUN echo "$DOPPLER_TOKEN DOPPLER_TOKEN"
# RUN echo "$POSTGRES_PASSWORD POSTGRES_PASSWORD"
# RUN doppler run -- echo "$POSTGRES_PASSWORD POSTGRES_PASSWORD"

CMD [ "doppler", "run", "--", "postgres" ]
