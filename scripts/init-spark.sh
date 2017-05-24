#!/bin/bash
BASE_DIR="/media/raajay"
SPARK_DIR=$BASE_DIR/spark

#git clone https://github.com/apache/spark.git $SPARK_DIR

# spark requires java, in Ubuntu 16.04, the default is Java 8
sudo apt-get install --assume-yes default-jre default-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

cd $SPARK_DIR; ./build/mvn -DskipTests clean package
