#Provide a valid startdate
startdate=2021-05-20
#Provide a valid startdate
enddate=2021-05-23


sDateTs=`date -j -f "%Y-%m-%d" $startdate "+%s"`
eDateTs=`date -j -f "%Y-%m-%d" $enddate "+%s"`
dateTs=$sDateTs
offset=86400

while [ "$dateTs" -le "$eDateTs" ]
do
  date=`date -j -f "%s" $dateTs "+%Y-%m-%d"`
  #Scantime time is hardcoded so it will not generate duplicates in Soda Cloud.
  scantimestamp="${date}T09:00:00+02:00"
  printf '%s\n' $scantimestamp
  printf '%s\n' $date
  # -v option is for the filter in the scan yaml file.
  # -t option is to set the scan time so that historical scans can be
  # logged in Soda Cloud.
  soda scan postgres-local/warehouse.yml postgres-local/tables/entaincustomer.yml -v date=$date -t $scantimestamp
  dateTs=$(($dateTs+$offset))
done
