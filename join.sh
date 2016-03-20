#!/bin/bash
#1:Read some turnstile data into a single file.
rm ts_stations.txt ts_transfers.txt sample_ts_data.txt readyformerge.txt gt_ids_names.txt

cp turnstile_data/turnstile_150711.txt ./sample_ts_data.txt
cat turnstile_data/turnstile_141018.txt >> sample_ts_data.txt

#2: TS DATA: Stations go to ts_stations.txt, all transfers go to ts_transfers.txt
awk -f pp_turnstile.awk 

#3: gtfs data >> goes to gt_ids_names.txt
awk -f pp_namesformerge.awk 


python match_names.py #(It goes to matchtable.txt)

awk -f takethetop.awk #(goes to unmatched.txt and matched.txt)
awk -f smalledits.awk #(goes to readyformerge.txt)

rm matched.txt unmatched.txt 
rm ./sample_ts_data.txt

#12: Eiman's file:
#../GoogleLineNames.csv

#13: python gtfsorderlinenames.py (It goes to s_gtfs_names.csv)
#14: mkdir new_ts
#15: python orderlinenames.py (Lots of files go to new_ts; problem with 20141206)
#16: cd ../
#17: trainnames.R
