# DE-Assessment
Azure Services used:
- Azure Data Lake Storage(ADLS)
- Azure Data Factory(ADF)
- Azure Databricks
- Azure SQL Database

## Containers in ADLS:
- staging - location where sourcing team will place the data file in csv format
- raw - location where files will be fetched from staging container
- processed - location where processed data will be kept

## Actual pipeline built using Azure Data Factory(ADF)
![image](https://github.com/user-attachments/assets/1958d80e-f2ad-47c7-80d7-39de05f038fd)

## Copy Data Activity
This will pull the data from staging container which is in csv format and place the data in raw container in parquet format.

## Notebook - Process Data
This activity will take the data from raw container and perform necessary validations and apply relevant business logic and transform data accordingly.
At the end it will filter data by country and write it to a separate directory with Country_Name under processed container.
## Get Metadata Activity
This activity will give us the metadata about processed container which will tell us how many directories are made by the previous step in processed container.
## ForEach Activity
Lets suppose there are 5 directories present in processed container.
This acivity will run for 5 times and under each iteration it will pull the data from respective directory and push it to a country_table in Azure SQL Database.
It will check whether respective country_table exists or not and then create a new table if table doesn't exist.
## ForEach Activity2
This activity will basically ensure that all the directories previously made under processed container gets deleted.



