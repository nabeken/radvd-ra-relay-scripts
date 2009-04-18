#!/bin/sh

IFACE=$1

rdisc6 -1 $IFACE | grep -i prefix | cut -d ':' -f2- | sed 's/^.//g'
