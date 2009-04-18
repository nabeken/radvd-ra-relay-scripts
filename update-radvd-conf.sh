#!/bin/sh

IFACE=$1

gen-radvd-conf.sh $IFACE > /tmp/radvd.conf.$$

DIFF=$(diff -u /etc/radvd.conf /tmp/radvd.conf.$$)

# FIXME: エラー処理が甘いのでどうにかする
if [ "$DIFF" ]; then
    cp /tmp/radvd.conf.$$ /etc/radvd.conf
    rm /tmp/radvd.conf.$$
    /etc/init.d/radvd restart
fi
