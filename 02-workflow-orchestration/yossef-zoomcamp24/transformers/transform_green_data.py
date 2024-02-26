if 'transformer' not in globals():
    from mage_ai.data_preparation.decorators import transformer
if 'test' not in globals():
    from mage_ai.data_preparation.decorators import test


@transformer
def transform(data, *args, **kwargs):
    # Remove rows where the passenger count is equal to 0 and the trip distance is equal to zero.
    data = data[(data['passenger_count'] > 0) & (data['trip_distance'] > 0)]

    # Converting lpep_pickup_datetime to date
    data['lpep_pickup_date'] = data['lpep_pickup_datetime'].dt.date

    # Rename columns in Camel Case to Snake Case (PostgresDB friendly)
    data.columns = (data.columns
                    .str.replace(' ', '_')
                    .str.lower()
    )

    
    return data


@test
def test_output(output, *args) -> None:
    assert (output['passenger_count'].isin([0]).sum() == 0)\
        and (output['trip_distance'].isin([0]).sum() == 0)\
        and ('vendorid' in list(output.columns))\
        , 'There is rows with passenger and trip distance equals zero'
