#!/bin/bash
./build/mvn -DskipTests -Phive-2.3 -Phive-thriftserver -Dhadoop-3.2 -pl :spark-mllib_2.12 clean package
databricks fs cp mllib/target/spark-mllib_2.12-3.2.1.jar dbfs:/customize-resources/jars/----workspace_spark_3_2--mllib--mllib-hive-2.3__hadoop-3.2_2.12_deploy_shaded.jar