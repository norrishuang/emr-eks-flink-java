ARG FLINK_BASE_IMAGE=public.ecr.aws/emr-on-eks/flink/emr-6.15.0-flink:latest
ARG MAVEN_VERSION=3.9.6
ARG MAVEN_URL=https://apache.osuosl.org/maven/maven-3/${MAVEN_VERSION}/binaries
ARG VERSION=1.0.0
ARG FLINK_VERSION=1.17.1

FROM ${FLINK_BASE_IMAGE}
USER root

RUN yum update -y
RUN yum group install -y "Development Tools" && \
    yum install -y wget tar
#    && curl -o /tmp/hadoop-common-3.3.6.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-common/3.3.6/hadoop-common-3.3.6.jar \
#    && echo "Done" \
#    && curl -o /tmp/hadoop-mapreduce-client-core-3.3.6.jar https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-mapreduce-client-core/3.3.6/hadoop-mapreduce-client-core-3.3.6.jar \
#    && echo "Done" \

RUN curl -o /tmp/flink-parquet-${FLINK_VERSION}.jar https://repo1.maven.org/maven2/org/apache/flink/flink-parquet/${FLINK_VERSION}/flink-parquet-${FLINK_VERSION}.jar \
#    && echo "Done" \
    && curl -o /tmp/flink-sql-parquet-${FLINK_VERSION}.jar https://repo1.maven.org/maven2/org/apache/flink/flink-sql-parquet/${FLINK_VERSION}/flink-sql-parquet-${FLINK_VERSION}.jar \
#    && echo "Done" \
#    && curl -o /tmp/kafka-clients-3.6.1.jar https://repo1.maven.org/maven2/org/apache/kafka/kafka-clients/3.6.1/kafka-clients-3.6.1.jar \
#    && echo "Done" \
#    && curl -o /tmp/flink-connector-kafka-3.0.2-1.18.jar https://repo1.maven.org/maven2/org/apache/flink/flink-connector-kafka/3.0.2-1.18/flink-connector-kafka-3.0.2-1.18.jar \
#    && echo "Done" \
#    && curl -o /tmp/aws-msk-iam-auth-2.0.3.jar https://repo1.maven.org/maven2/software/amazon/msk/aws-msk-iam-auth/2.0.3/aws-msk-iam-auth-2.0.3.jar \
#    && echo "Done" \
#    && curl -o /tmp/parquet-hadoop-1.13.1.jar https://repo1.maven.org/maven2/org/apache/parquet/parquet-hadoop/1.13.1/parquet-hadoop-1.13.1.jar \
#    && echo "Done" \
#    && mkdir -p /usr/lib/flink/plugins/hadoop-common /usr/lib/flink/plugins/hadoop-mapreduce-client-core /usr/lib/flink/plugins/flink-parquet \
#      /usr/lib/flink/plugins/flink-sql-parquet /usr/lib/flink/plugins/kafka-clients /usr/lib/flink/plugins/flink-connector-kafka \
#      /usr/lib/flink/plugins/aws-msk-iam-auth /usr/lib/flink/plugins/parquet-hadoop \
#    && cp /tmp/hadoop-common-3.3.6.jar /usr/lib/flink/plugins/hadoop-common/hadoop-common-3.3.6.jar \
#    && cp /tmp/hadoop-mapreduce-client-core-3.3.6.jar /usr/lib/flink/plugins/hadoop-mapreduce-client-core/hadoop-mapreduce-client-core-3.3.6.jar \
#    && cp /tmp/flink-parquet-1.18.0.jar /usr/lib/flink/plugins/flink-parquet/flink-parquet-1.18.0.jar \
#    && cp /tmp/flink-sql-parquet-1.18.0.jar /usr/lib/flink/plugins/flink-sql-parquet/flink-sql-parquet-1.18.0.jar \
#    && cp /tmp/kafka-clients-3.6.1.jar /usr/lib/flink/plugins/kafka-clients/kafka-clients-3.6.1.jar \
#    && cp /tmp/flink-connector-kafka-3.0.2-1.18.jar /usr/lib/flink/plugins/flink-connector-kafka/flink-connector-kafka-3.0.2-1.18.jar \
#    && cp /tmp/aws-msk-iam-auth-2.0.3.jar /usr/lib/flink/plugins/aws-msk-iam-auth/aws-msk-iam-auth-2.0.3.jar \
#    && cp /tmp/parquet-hadoop-1.13.1.jar /usr/lib/flink/plugins/parquet-hadoop/parquet-hadoop-1.13.1.jar
#
#
    && mkdir -p /usr/share/maven \
    && curl -o /tmp/apache-maven.tar.gz ${MAVEN_URL}/apache-maven-${MAVEN_VERSION}-bin.tar.gz \
    && tar -xzf /tmp/apache-maven.tar.gz -C /usr/share/maven --strip-components=1 \
    && rm -f /tmp/apache-maven.tar.gz \
    && ln -s /usr/share/maven/bin/mvn /usr/bin/mvn \

RUN mkdir -p $FLINK_HOME/usrlib

RUN git clone https://github.com/norrishuang/emr-eks-flink-java.git /tmp/emr-eks-flink-java && \
    cd /tmp/emr-eks-flink-java/ && \
    mvn clean compile package install assembly:assembly -Dmaven.test.skip=true

COPY /tmp/flink-parquet-${FLINK_VERSION}.jar /usr/lib/flink/plugins/flink-parquet-${FLINK_VERSION}.jar
COPY /tmp/flink-sql-parquet-${FLINK_VERSION}.jar /usr/lib/flink/plugins/flink-sql-parquet-${FLINK_VERSION}.jar

COPY /tmp/emr-eks-flink-java/target/emr-eks-flink-java-1.0.2.jar $FLINK_HOME/usrlib/emr-eks-flink-java-1.0.2.jar
# # Use hadoop user and group 
USER hadoop:hadoop