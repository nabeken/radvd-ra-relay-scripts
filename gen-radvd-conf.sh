#!/bin/sh
IFACE=$1

cat <<EOF
interface eth2
{
   AdvSendAdvert on;
   prefix $(get-ra-prefix.sh $IFACE)
   {
       AdvPreferredLifetime 120;
       AdvValidLifetime 300;
   };
};   
EOF
