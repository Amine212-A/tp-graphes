#!/bin/bash
tok=$(cat ../token.gh)

while read -r id; do
    echo "Téléchargement de l'artifact ID : $id"
    curl -L \
      -H "Accept: application/vnd.github+json" \
      -H "Authorization: Bearer $tok" \
      -H "X-GitHub-Api-Version: 2022-11-28" \
      "https://api.github.com/repos/Amine212-A/tp-graphes/actions/artifacts/$id/zip" \
      --output "artifact_$id.zip"
      
    unzip -o "artifact_$id.zip" -d "extracted_$id"
done < liste-id.txt
