#!/bin/bash
sleep 30
nmcli con delete WIFI-AP
nmcli con add type wifi ifname wlan0 mode ap con-name WIFI-AP ssid joseromera.net autoconnect false
nmcli con modify WIFI-AP wifi.band bg
nmcli con modify WIFI-AP wifi.channel 3
nmcli con modify WIFI-AP wifi.cloned-mac-address 00:12:34:56:78:9a
nmcli con modify WIFI-AP wifi-sec.key-mgmt wpa-psk
nmcli con modify WIFI-AP wifi-sec.proto rsn
nmcli con modify WIFI-AP wifi-sec.group ccmp
nmcli con modify WIFI-AP wifi-sec.pairwise ccmp
nmcli con modify WIFI-AP wifi-sec.psk "Kojiro2015"
nmcli con modify WIFI-AP ipv4.method shared ipv4.address 10.0.0.1/24
nmcli con modify WIFI-AP ipv6.method disabled
nmcli con up WIFI-AP