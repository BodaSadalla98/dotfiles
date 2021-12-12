##!/bin/bash 
#echo "Setting default sink to: $1";
#pacmd set-default-sink $1
#pacmd list-sink-inputs | grep index | while read line
#do
#echo "Moving input: ";
#echo $line | cut -f2 -d' ';
#echo "to sink: $1";
#pacmd move-sink-input `echo $line | cut -f2 -d' '` $1

#done


#!/usr/bin/env bash

# case "${1:-}" in
  # (""|list)
    # pacmd list-sinks |
      # grep -E 'index:|name:'
    # ;;
  # ([0-9]*)
    # echo switching default
    # pacmd set-default-sink $1 ||
      # echo failed
    # echo switching applications
    # pacmd list-sink-inputs |
      # awk '/index:/{print $2}' |
      # xargs -r -I{} pacmd move-sink-input {} $1 ||
        # echo failed
    # ;;
  # (*)
    # echo "Usage: $0 [|list|<sink name to switch to>]"
    # ;;
# esac



#!/bin/bash 

new_sink=$(pacmd list-sinks | grep index | tee /dev/stdout | grep -m1 -A1 "* index" | tail -1 | cut -c12-)

echo "Setting default sink to: $new_sink";
pacmd set-default-sink $new_sink
pacmd list-sink-inputs | grep index | while read line
do
echo "Moving input: ";
echo $line | cut -f2 -d' ';
echo "to sink: $new_sink";
pacmd move-sink-input `echo $line | cut -f2 -d' '` $new_sink

done
