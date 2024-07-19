FROM mbarlocker/docker-typescript-dev:latest

ENV TZ="UTC"
ARG DEBIAN_FRONTEND=noninteractive

RUN apt update && apt install -y hugo \
    && rm -rf /var/lib/apt/lists/

VOLUME ["/app"]
EXPOSE 9000

COPY entry.sh /entry-app.sh
COPY env.sh /env.sh
