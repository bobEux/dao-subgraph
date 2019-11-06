#!/bin/bash
set -euo pipefail

payload=$(
cat <<EOM
{
    "attachments": [
        {
            "fallback": "DAO Subgraph deployed successfully.",
            "color": "#33CC66",
            "pretext": "DAO Subgraph deployed successfully.",
            "title": "$CIRCLE_PROJECT_REPONAME",
            "title_link": "https://circleci.com/workflow-run/$CIRCLE_WORKFLOW_WORKSPACE_ID",
            "text": "Visit URL: https://thegraph.com/explorer/subgraph/pillarwallet/ambassadaors",
            "ts": $(date '+%s')
        }
    ]
}
EOM
)

curl -X POST --data-urlencode payload="$payload" "$SLACK_WEBHOOK_URL"
