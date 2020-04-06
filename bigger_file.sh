#!/bin/bash

value=$(du -m /var | sort -n -r | head -n 1 | awk '{print $1}')

if [[ $value -gt 27 ]]; then
               echo run command if yes
            else
               echo run command if no or break
            fi
