FROM mbarlocker/docker-typescript-dev:latest

RUN apt update && apt install -y hugo \
    && rm -rf /var/lib/apt/lists/

VOLUME ["/app"]
EXPOSE 9000

COPY launch.sh /startup/app/999-hugo
COPY env.sh /env.sh
