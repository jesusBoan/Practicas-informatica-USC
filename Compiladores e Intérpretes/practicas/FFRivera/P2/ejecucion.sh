#!/bin/bash

valoresN=(100 250 500 750 1000 3500 7500 10000 11000 12000 13000 14000 15000 16000)
rm resultados.csv
touch resultados.csv
echo -e "Version\tN\tIteracion\tTiempo\tTiempo/Iteracion" >> resultados.csv

gcc -O0 mainDinamico.c

for N in "${valoresN[@]}" ; do
    ./a.out $N >> resultados.csv
done;