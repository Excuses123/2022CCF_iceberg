#!/usr/bin/env bash

rm -rf submit/jars && mkdir -p submit/jars

mvn package -am -DskipTests

cp target/2022CCF_iceberg-1.0-SNAPSHOT.jar submit/jars/datalake_contest.jar
mvn dependency:copy-dependencies -DoutputDirectory=./submit/jars -DincludeScope=runtime -am

rm -f submit/submit.zip
zip -r -j submit/submit.zip submit/jars/*
