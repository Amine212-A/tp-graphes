#!/bin/bash

if [ -z "$1" ]; then
  echo "Erreur : argument manquant (ex: ./run1.sh g1)"
  exit 1
fi

tool="neato"

echo "Traitement du fichier $1.dot avec $tool..."
$tool -Tpng "$1.dot" > "$1.png"
$tool -Tsvg "$1.dot" > "$1.svg"
echo "Terminé !"
