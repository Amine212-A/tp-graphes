tok=$(cat ../token.gh)
echo $tok


curl -L \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer $tok" \
-H "X-GitHub-Api-Version: 2022-11-28" \
https://api.github.com/repos/Amine212-A/tp-graphes/actions/artifacts > gh-artifacts.json

ARTIFACT_ID=$(jq -r '.artifacts[0].id' gh-artificats.json)
echo "ID extrait : $ARTIFACT_ID"


curl -L \
-H "Accept: application/vnd.github+json" \
-H "Authorization: Bearer $tok" \
-H "X-GitHub-Api-Version: 2022-11-28" \
https://api.github.com/repos/Amine212-A/tp-graphes/actions/artifacts/$ARTIFACT_ID/zip \
--output artifact.zip


unzip -o artifact.zip