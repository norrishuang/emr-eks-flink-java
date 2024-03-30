ARG FLINK_BASE_IMAGE=public.ecr.aws/emr-on-eks/flink/emr-6.14.0-flink:latest


ARG VERSION=1.0.0

FROM ${FLINK_BASE_IMAGE}
USER root

ENV FLINK_VERSION "1.17.1"
ENV MAVEN_VERSION "3.9.6"
ENV MAVEN_URL "https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries"

ENV HADOOP_VERSION "3.3.3"

RUN yum update -y
RUN yum group install -y "Development Tools" && \
    yum install -y wget tar && \
    mkdir -p /usr/share/maven

RUN wget ${MAVEN_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz -O /tmp/apache-maven.tar.gz && \
    tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 && \
    rm -f /tmp/apache-maven.tar.gz && \
    ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

RUN mkdir -p $FLINK_HOME/usrlib

RUN git clone https://github.com/norrishuang/emr-eks-flink-java.git /tmp/emr-eks-flink-java && \
    cd /tmp/emr-eks-flink-java/ && \
    git pull && \
    mvn clean install

RUN cp /tmp/emr-eks-flink-java/target/emr-eks-flink-java-1.0.6.jar $FLINK_HOME/lib/emr-eks-flink-java-1.0.6.jar

RUN wget https://repo1.maven.org/maven2/org/apache/flink/flink-parquet/${FLINK_VERSION}/flink-parquet-${FLINK_VERSION}.jar -O $FLINK_HOME/lib/flink-parquet-${FLINK_VERSION}.jar && \
    wget https://repo1.maven.org/maven2/org/apache/flink/flink-sql-parquet/${FLINK_VERSION}/flink-sql-parquet-${FLINK_VERSION}.jar -O $FLINK_HOME/lib/flink-sql-parquet-${FLINK_VERSION}.jar

# # Use hadoop user and group 
USER hadoop:hadoop