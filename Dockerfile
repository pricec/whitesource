ARG AGENT_VERSION=20.1.2

FROM golang:1.13.7-alpine3.11
ARG AGENT_VERSION

RUN apk update && apk add openjdk8-jre
RUN GO111MODULE=on go get -u github.com/LK4D4/vndr@85886e1ac99b8d96590e6e0d9f075dc7a711d132 && cp /go/bin/vndr /usr/local/bin
RUN wget https://unified-agent.s3.amazonaws.com/wss-unified-agent-${AGENT_VERSION}.jar -O /wss-unified-agent.jar

ENTRYPOINT ["java", "-jar", "/wss-unified-agent.jar"]
