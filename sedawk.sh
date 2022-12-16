#!/bin/bash

awk -F: '{OFS=":"; if ($1=="saned") $7="/bin/bash"; print}' ./passwd | \
awk -F: '!/daemon/ {OFS=":"; print}' | \
sed '/avahi/s/\/usr\/sbin\/nologin/\/bin\/bash/g' | \
awk -F: '{OFS=":"; print $1,$3,$5,$7}' | \
awk -F: '{OFS=":"; if (($2 %2) == 0) $4="/bin/zsh"; print}' > ./passwd_new