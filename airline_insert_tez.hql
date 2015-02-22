use airline;
set hive.execution.engine=tez;
set hive.exec.dynamic.partition.mode=nonstrict;
set hive.auto.convert.join=true;
SET hive.exec.compress.output=true;
set hive.vectorized.execution.enabled=true;
set hive.exec.parallel=true;
INSERT OVERWRITE table airline
partition(p_year)
Select month, 
dayofmonth,
dayofweek,
deptime,
crsdeptime,
arrtime,
crsarrtime,
uniquecarrier,
flightnum,
tailnum,
actualelapsedtime,
crselapsedtime,
airtime,
arrdelay,
depdelay,
origin,
dest,
distance,
taxiin,
taxiout,
cancelled,
cancellationcode,
diverted,
carrierdelay,
weatherdelay,
nasdelay,
securitydelay,
lateaircraftdelay,
year
from airline_ext;