#!/bin/bash
for arg; do
  case "$arg" in
    --nohost) cut_host="s/`hostname`//;"
  esac
done
sed -r "${cut_host}s/#033/\x1B/g;s/#015/\x0D/g"

