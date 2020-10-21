Checking for data integrity
use bts;
Query the trips table for unique pickup location regions:

select distinct(pickup_location_id) from trips;

select
  max(trip_distance),
  min(trip_distance)
from
  trips;
  
  
 One would expect the trip distance to be greater than 0 and less than, say 1000 miles.
 The maximum trip distance returned of 85 miles seems reasonable but the minimum trip
 distance of 0 seems buggy. How many trips in the dataset have a trip distance of 0?

select count(*) from trips where trip_distance = 0;

There are 155 such trips in the database. These trips warrant further exploration. 
You'll find that these trips have non-zero payment amounts associated with them.
Perhaps these are fraudulent transactions? Let's see if we can find more data that 
doesn't meet our expectations. We expect the fare_amount column to be positive. 
Enter the following query to see if this is true in the database:

select count(*) from trips where fare_amount < 0;

There should be 14 such trips returned. Again, these trips warrant further exploration. 
There may be a reasonable explanation for why the fares take on negative numbers.
However, it's up to the data engineer to ensure there are no bugs in the data pipeline that would cause such a result.

Finally, let's investigate the payment_type column.

select
  payment_type,
  count(*)
from
  trips
group by
  payment_type;
The results of the query indicate that there are four different payment types, with:

payment type = 1 has 13863 rows
payment type = 2 has 6016 rows
payment type = 3 has 113 rows
payment type = 4 has 32 rows
