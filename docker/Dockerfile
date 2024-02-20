ARG FLINK_BASE_IMAGE=public.ecr.aws/emr-on-eks/flink/emr-6.14.0-flink:latest
ARG MAVEN_VERSION=3.9.6
ARG MAVEN_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries
ARG VERSION=1.0.0

FROM ${FLINK_BASE_IMAGE}
USER root

ENV FLINK_VERSION "1.17.1"

RUN yum update -y
RUN yum group install -y "Development Tools" && \
    yum install -y wget tar
#    && curl -o /tmp/hadoop-common-3.3.6.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.3.6/hadoop-common-3.3.6.jar \
#    && echo "Done" \
#    && curl -o /tmp/hadoop-mapreduce-client-core-3.3.6.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-mapreduce-client-core/3.3.6/hadoop-mapreduce-client-core-3.3.6.jar \
#    && echo "Done" \

RUN wget https://repo1.maven.org/maven2/org/apache/flink/flink-parquet/1.17.1/flink-parquet-1.17.1.jar -O /tmp/flink-parquet-1.17.1.jar  \
    && wget https://repo1.maven.org/maven2/org/apache/flink/flink-sql-parquet/1.17.1/flink-sql-parquet-1.17.1.jar -O /tmp/flink-sql-parquet-1.17.1.jar

RUN mkdir -p /usr/share/maven

RUN wget https://apache.osuosl.org/maven/maven-3/3.9.6/binaries/apache-maven-3.9.6-bin.tar.gz -O /tmp/apache-maven.tar.gz

RUN tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
    && rm -f /tmp/apache-maven.tar.gz \
    && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn

RUN mkdir -p $FLINK_HOME/usrlib

RUN git clone https://github.com/norrishuang/emr-eks-flink-java.git /tmp/emr-eks-flink-java && \
    cd /tmp/emr-eks-flink-java/ && \
    mvn clean install

RUN cp /tmp/flink-parquet-${FLINK_VERSION}.jar /usr/lib/flink/plugins/flink-parquet-${FLINK_VERSION}.jar \
    && cp /tmp/flink-sql-parquet-${FLINK_VERSION}.jar /usr/lib/flink/plugins/flink-sql-parquet-${FLINK_VERSION}.jar \
    && cp /tmp/emr-eks-flink-java/target/emr-eks-flink-java-1.0.4.jar $FLINK_HOME/usrlib/emr-eks-flink-java-1.0.4.jar
# # Use hadoop user and group 
USER hadoop:hadoop