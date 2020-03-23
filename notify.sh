MSG=$(git log -1 --format="%h %ai <%an> %s")
COMMIT=$(git log -1 --format="%H")
BRANCH_NAME=$(echo ${CODEBUILD_WEBHOOK_HEAD_REF} | awk -F'/' '{print $NF}')
if [ $CODEBUILD_BUILD_SUCCEEDING -eq 1 ]; then
  STATUS='*SUCCESS*'
else
  STATUS='*FAILED*'
fi
REPO=$(echo $IMAGE_REPO_NAME | cut -f2- -d/)
curl -XPOST \
  -H "Content-Type: application/json" \
  -d "{'text':'${REPO} build for branch \'${BRANCH_NAME}\' status ${STATUS}\n\`\`\`${MSG}\n\n${COMMIT}\`\`\`'}" 'https://chat.googleapis.com/v1/spaces/AAAAOWUSpnc/messages?key=AIzaSyDdI0hCZtE6vySjMm-WEfRq3CPzqKqqsHI&token=GnBzdVfgtV6r3MZCPiFVdS8H74UtE0eQq9HugAA1_Cc%3D'
