FROM alpine:latest
MAINTAINER fithwum

ENV UID=99
ENV GUID=100

# Install dependencies and folder creation
RUN apk update && apk add --no-cache ca-certificates libstdc++ su-exec bash-completion tar nodejs npm \
	&& mkdir -p /foundry \
	&& chmod 777 -R /foundry \
	&& chown 99:100 -R /foundry

# directory where data is stored
WORKDIR /foundry

RUN mkdir -p /foundry/fvtt /foundry/data \
	&& chmod 777 -R /foundry \
	&& chown 99:100 -R /foundry

# TCP Port
EXPOSE 30000

# Run command
CMD [ "/ts3temp/Install_Script.sh" , "node", "fvtt/resources/app/main.js", "--headless", "--dataPath=/foundry/data" ]
