#!/bin/bash

xbindkeys -f <(echo -e "\"$2 & killall xbindkeys\"\n\t$1") -n
