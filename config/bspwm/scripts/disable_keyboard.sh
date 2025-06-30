#!/bin/bash

xinput list | grep -q "CX 2.4G Wireless Receiver Keyboard"

if [ $? -eq 0 ]; then
  xinput disable "AT Translated Set 2 keyboard"
else
  xinput enable "AT Translated Set 2 keyboard"
fi
