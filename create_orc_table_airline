create table airline (
month int, 
dayofmonth int,
dayofweek int,
deptime int,
crsdeptime int,
arrtime int,
crsarrtime int,
uniquecarrier string,
flightnum int,
tailnum string,
actualelapsedtime int,
crselapsedtime int,
airtime int,
arrdelay int,
depdelay int,
origin string,
dest string,
distance int,
taxiin int,
taxiout int,
cancelled int,
cancellationcode string,
diverted int,
carrierdelay int,
weatherdelay int,
nasdelay int,
securitydelay int,
lateaircraftdelay int)
partitioned by (p_year int)
ROW FORMAT DELIMITED
FIELDS TERMINATED BY ','
lines terminated by '\n' 
STORED AS orcfile;