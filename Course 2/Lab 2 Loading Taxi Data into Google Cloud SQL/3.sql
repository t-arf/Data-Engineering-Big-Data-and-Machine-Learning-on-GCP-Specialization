Add data to Cloud SQL instance
gsutil cp gs://cloud-training/OCBL013/nyc_tlc_yellow_trips_2018_subset_1.csv trips.csv-1
gsutil cp gs://cloud-training/OCBL013/nyc_tlc_yellow_trips_2018_subset_2.csv trips.csv-2



Import the CSV file data into Cloud SQL using mysql:


mysqlimport --local --host=$MYSQLIP --user=root --password \
--ignore-lines=1 --fields-terminated-by=',' bts trips.csv-*


Connect to the mysql interactive console:
mysql --host=$MYSQLIP --user=root  --password

