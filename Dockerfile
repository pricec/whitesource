ARG AGENT_VERSION=20.1.2

FROM alpine:3.9.5
ARG AGENT_VERSION

RUN apk update && apk add openjdk8-jre
RUN wget https://unified-agent.s3.amazonaws.com/wss-unified-agent-${AGENT_VERSION}.jar -O /wss-unified-agent.jar

CMD ["java", "-jar", "/wss-unified-agent.jar"]
