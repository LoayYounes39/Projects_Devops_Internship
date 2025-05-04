#!/bin/bash 
./sym_crypt -i ./msg1.txt -o ./Script/CRYPT/ -o key.txt -m xor -l log.txt
./sym_crypt -i clair.txt -i crypt.txt -f key.txt -m xor -l log.txt

