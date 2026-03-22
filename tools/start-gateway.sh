#!/bin/bash
export PATH=/opt/homebrew/bin:/opt/homebrew/sbin:/usr/local/bin:/usr/bin:/bin
cd /Users/zzimong
nohup openclaw gateway run > /tmp/gateway-fg.log 2>&1 &
echo "Gateway started: PID $!"
