FROM python:3.9

RUN apt-get install wget 
RUN pip install pandas sqlalchemy psycopg2

WORKDIR /app
COPY ingest_data.py ingest_data.py 

ENTRYPOINT [ "python", "ingest_data.py" ]


# winpty docker run -it --network=pg-network ingest_taxi_green:v001 --user root --password root --host pgdatabase --port 5432 --table_name green_taxi_data \
# --url https://github.com/DataTalksClub/nyc-tlc-data/releases/download/green/green_tripdata_2019-09.csv.gz  --db ny_taxi