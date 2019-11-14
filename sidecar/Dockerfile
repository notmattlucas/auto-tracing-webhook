FROM alpine:3

RUN wget -O opentracing-specialagent-1.5.0.jar "http://central.maven.org/maven2/io/opentracing/contrib/specialagent/opentracing-specialagent/1.5.0/opentracing-specialagent-1.5.0.jar"

RUN mkdir -p /mnt/shared

VOLUME /mnt/shared

ENTRYPOINT ["cp", "-v", "opentracing-specialagent-1.5.0.jar", "/mnt/shared"]
