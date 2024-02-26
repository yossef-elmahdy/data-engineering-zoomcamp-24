import pyarrow as pa 
import pyarrow.parquet as pq
import os 

if 'data_exporter' not in globals():
    from mage_ai.data_preparation.decorators import data_exporter


os.environ['GOOGLE_APPLICATION_CREDENTIALS'] = "/home/src/personal-gcp.json/creds-key.json"

bucket_name = 'data-bucket-zoomcamp24'
project_id = 'de-project-411714'
table_name = 'yellow_taxi_data_parquet'

root_path = f'{bucket_name}/{table_name}'

@data_exporter
def export_data(data, *args, **kwargs):
    data['tpep_pickup_date'] = data['tpep_pickup_datetime'].dt.date

    table = pa.Table.from_pandas(data)
    gcs = pa.fs.GcsFileSystem()

    pq.write_to_dataset(
        table,
        root_path=root_path, 
        partition_cols=['tpep_pickup_date'],
        filesystem=gcs
    )

