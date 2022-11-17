#!/bin/bash
## Build the customize Spark mllib
./build/mvn -DskipTests -Phive-2.3 -Phive-thriftserver -Dhadoop-3.2 -pl :spark-mllib_2.12 clean package
## Install databricks CLI
pip install databricks-cli
## Authentication with Databricks personal access token. You need both Databricks host and Token
databricks configure --token
# Databricks Host (should begin with https://):
# Token: 
## Copy all necessary resources to Databricks DBFS
databricks fs cp mllib/target/spark-mllib_2.12-3.2.1.jar dbfs:/customize-resources/jars/----workspace_spark_3_2--mllib--mllib-hive-2.3__hadoop-3.2_2.12_deploy_shaded.jar
databricks fs cp databricks/databricks/mllib-install.sh dbfs:/customize-resources/init-scripts/mllib-install.sh