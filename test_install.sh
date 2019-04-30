#!/bin/bash

for f in .??*
do
  [[ "$f" == ".git" ]] && continue
  echo "$f"
done
