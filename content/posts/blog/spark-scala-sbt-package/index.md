---
title: "Setting up a Scala Spark project in sbt"
date: 2025-06-23T15:16:26+02:00
categories: 
 - Blog
tags: 
 - Spark
 - Scala
draft: true
---

# Steps

Prerequisites:
- Scala / cs
- dbt
- Java 

# Steps

* Create directories for sbt
* Add dependencies in *build.sbt*: [correct versions](https://community.cloudera.com/t5/Community-Articles/Spark-and-Java-versions-Supportability-Matrix/ta-p/383669)
* Create .jvmopts to resolve [error](https://stackoverflow.com/questions/73465937/apache-spark-3-3-0-breaks-on-java-17-with-cannot-access-class-sun-nio-ch-direct) or use more recent version?
* Configure log level in *src/main/resources/log4j2.properties* 
* Add small example data *src/main/resources/data/countries_full.csv* 
