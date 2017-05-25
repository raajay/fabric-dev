#!/bin/bash
BASE_DIR="/media/raajay"
SPARK_DIR=$BASE_DIR/spark

git clone https://github.com/apache/spark.git $SPARK_DIR

# spark requires java, in Ubuntu 16.04, the default is Java 8
sudo apt-get install --assume-yes default-jre default-jdk
export JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64/jre

# official build is using mvn
cd $SPARK_DIR; ./build/mvn -DskipTests clean package

# dev setup -- for Spark dev purposes SBT is preferred. As of 2.1.11 of Spark, sbt version in 0.13.13 and scala is 2.11.8
cd $SPARK_DIR; ./build/sbt -DskipTests clean package # test if sbt build works

# sbt-ensime is a useful plugin to generate .ensime files for each project
mkdir -p ~/.sbt/0.13/plugins
echo 'addSbtPlugin("org.ensime" % "sbt-ensime" % "1.12.12")' >> ~/.sbt/0.13/plugins/plugins.sbt
# a configuration file for sbt-ensime
cp /local/repository/scripts/spark/ensime.sbt $SPARK_DIR/ensime.sbt

# this generate the ensime files
cd $SPARK_DIR; ./build/sbt ensimeConfig ensimeConfigProject
