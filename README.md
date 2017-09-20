# aws data-pipeline sql to zipped csv
AWS data pipeline cloud formation script and bash script to create csv on s3 from a PostgreSQL query.

Setup:
1. Create s3 paths for the logs, scripts and dump e.g.:
```
"s3://data-etl/",
"s3://data-etl/logs/",
"s3://data-etl/scripts/",
```

2. upload the dump_sql.sh to the /scripts/ folder on s3
3. update parameter values in pipline.json to match your environment (the s3 parameters should match your s3 folders above).
4. update the sql query in the activity "Dump query to csv" in pipeline.json
3. Create a aws pipeline from the CLI with:
`aws datapipeline create-pipeline --name some-name --unique-id some-id`
4. Upload the configuration to the create data pipeline
```
 aws datapipeline put-pipeline-definition --pipeline-definition file://pipeline.json --pipeline-id "the id from the newly created pipeline"
```
5. Activate the pipeline in the AWS console and you are good to go!!
