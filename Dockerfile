FROM mbarlocker/docker-typescript-dev:v0.0.5

RUN apt update && apt install -y hugo \
    && rm -rf /var/lib/apt/lists/

VOLUME ["/app"]
EXPOSE 9000

COPY launch.sh /startup/app/999-hugo
RUN bash -n /startup/app/999-hugo

COPY env.sh /env.sh
RUN bash -n /env.sh
