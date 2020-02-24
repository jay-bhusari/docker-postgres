# Start from debian jessie-slim
FROM debian:9

RUN set -eux; \
  	apt-get update; \
  	apt-get install -y --no-install-recommends; \
    mkdir -p \openjdk\

ENV JAVA_HOME /usr/local/openjdk-8
ENV PATH $JAVA_HOME/bin:$PATH
   
ENV JAVA_VERSION 8u242
ENV JAVA_BASE_URL https://github.com/AdoptOpenJDK/openjdk8-upstream-binaries/releases/download/jdk8u242-b08/OpenJDK8U-jdk_
ENV JAVA_URL_VERSION 8u242b08  # OpenJDK8U-jdk_x64_linux_8u242b08.tar.gz

CMD 

RUN wget -O openjdk.tgz.asc "${JAVA_BASE_URL}${upstreamArch}_linux_${JAVA_URL_VERSION}.tar.gz.sign"; \
  wget -O openjdk.tgz "${JAVA_BASE_URL}${upstreamArch}_linux_${JAVA_URL_VERSION}.tar.gz" --progress=dot:giga; \
  
