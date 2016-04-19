#!/bin/bash
# 三井住友VISAカードのCSVをパースするスクリプト

cat *.csv | nkf -w | grep -E '^2' | awk -F, '{printf "%s\t%s\t%s\n", $1, $2, $3}'



